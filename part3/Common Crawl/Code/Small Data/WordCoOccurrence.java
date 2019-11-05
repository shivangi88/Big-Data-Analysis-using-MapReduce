package mapreduce1.mapreduce1;

import java.util.*;
import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.MapWritable;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCoOccurrence {

	public static class StripesMapper extends Mapper<LongWritable, Text, Text, MapWritable> {
		private MapWritable occurrenceMap = new MapWritable();
		private Text word = new Text();
		private final static IntWritable one = new IntWritable(1);

		protected void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {
			List<String> topWords = new ArrayList<>(Arrays.asList("link", "like", "care","health"
					,"trump","job","nurse","campaign","republican","click"));
			int neighbors = context.getConfiguration().getInt("neighbors", 2);
			String[] words = value.toString().split("\\s+");
			if (words.length > 1) {
				for (int i = 0; i < words.length; i++) {
					if (topWords.contains(words[i])) {
						word.set(words[i]);
						occurrenceMap.clear();
						int start;
						if ((i - neighbors) < 0) {
							start = 0;
						} else {
							start = i - neighbors;
						}
						int end;
						if ((i + neighbors) >= (words.length)) {
							end = (words.length) - 1;
						} else {
							end = i + neighbors;
						}
						for (int j = start; j <= end; j++) {
							if (j == i)
								continue;
							Text neighbor = new Text(words[j]);
							if (occurrenceMap.containsKey(neighbor)) {
								IntWritable count = (IntWritable) occurrenceMap.get(neighbor);
								int temp = count.get();
								count.set(temp + 1);
							} else {
								occurrenceMap.put(neighbor, one);
							}
						}
						context.write(word, occurrenceMap);
					}
				}
			}
		}
	}

	public static class StripesReducer extends Reducer<Text, MapWritable, Text, MapWritable> {
		private MapWritable incrementingMap = new MapWritable();

		protected void reduce(Text key, Iterable<MapWritable> values, Context context)
				throws IOException, InterruptedException {
			incrementingMap.clear();
			for (MapWritable value : values) {
				addAll(value);
			}
			context.write(key, incrementingMap);
		}

		private void addAll(MapWritable token) {
			Set<Writable> keys = token.keySet();
			for (Writable key : keys) {
				IntWritable total = (IntWritable) token.get(key);
				if (incrementingMap.containsKey(key)) {
					IntWritable count = (IntWritable) incrementingMap.get(key);
					int temp = count.get();
					count.set(temp + total.get());
				} else {
					incrementingMap.put(key, total);
				}
			}
		}
	}

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		Configuration conf = new Configuration();
		Job job = Job.getInstance(conf);
		job.setJobName("stripes coccur");
		job.setJarByClass(WordCoOccurrence.class);
		job.setNumReduceTasks(1);
		job.setMapperClass(StripesMapper.class);
		job.setCombinerClass(StripesReducer.class);
		job.setReducerClass(StripesReducer.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(MapWritable.class);
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}

}
