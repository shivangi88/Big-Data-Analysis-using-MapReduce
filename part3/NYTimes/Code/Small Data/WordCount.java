
package mapreduce.mapreduce;

import java.io.IOException;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class WordCount {

	public static class WcMapper extends Mapper<Object, Text, Text, IntWritable> {

		private final static IntWritable one = new IntWritable(1);
		private Text token = new Text();

		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException, NoSuchElementException {
			StringTokenizer itr = new StringTokenizer(value.toString());
			while (itr.hasMoreTokens()) {
				String nexttoken = itr.nextToken();
				if (!((nexttoken.equals("and")) || (nexttoken.equals("the")) || (nexttoken.equals("u"))
						|| (nexttoken.equals("an")) || (nexttoken.equals("i")))) {
					token.set(nexttoken);
					context.write(token, one);
				}
				
			}
		}
	}

	public static class WcReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
		private IntWritable total_count = new IntWritable();

		public void reduce(Text key, Iterable<IntWritable> values, Context context)
				throws IOException, InterruptedException {
			int total = 0;
			while (values.iterator().hasNext()) {
				total += values.iterator().next().get();
			}
			total_count.set(total);
			context.write(key, total_count);
		}
	}

	public static void main(String[] args) throws Exception {
		Configuration conf = new Configuration();
		Job job = Job.getInstance(conf);
		job.setJobName("word count");
		job.setJarByClass(WordCount.class);
		job.setNumReduceTasks(1);
		job.setMapperClass(WcMapper.class);
		job.setCombinerClass(WcReducer.class);
		job.setReducerClass(WcReducer.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}