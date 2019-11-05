library(rtweet)
library(twitteR)
library(dplyr)
#Binding Trump CSV into 1 text file:-
tweet_1<-read.csv( " Path to read csv")
tweet_1_df<-select(tweet_1,text)
#total_text_t<-data.frame()
#rm(total_text_t)
total_text_t<-rbind(total_text_t,tweet_1_df)

write.table(total_text_t, "Path to write into txt file", sep="\t")



#Binding Election CSV into 1 text file:8
tweet_2<-read.csv("Path to read csv")
tweet_2_df<-select(tweet_2,text)
#total_text_el<-data.frame()
#rm(total_text_el)
total_text_el<-rbind(total_text_el,tweet_2_df)

write.table(total_text_el, "Path to write into txt file", sep="\t")



#Binding Campaign CSV into 1 text file:-
tweet_3<-read.csv("Path to read csv")
tweet_3_df<-select(tweet_3,text)
#total_text_c<-data.frame()
#rm(total_text_c)
total_text_c<-rbind(total_text_c,tweet_3_df)

write.table(total_text_c, "Path to write into txt file", sep="\t")


#Binding Immigration CSV into 1 text file:-
tweet_4<-read.csv("Path to read csv")
tweet_4_df<-select(tweet_4,text)
#total_text_i<-data.frame()
#rm(total_text_i)
total_text_i<-rbind(total_text_i,tweet_4_df)

write.table(total_text_i, "Path to write into txt file", sep="\t")

#Binding Economy CSV into 1 text file:-
tweet_5<-read.csv("Path to read csv")
tweet_5_df<-select(tweet_5,text)
#total_text_e<-data.frame()
#rm(total_text_e)
total_text_e<-rbind(total_text_e,tweet_5_df)

write.table(total_text_e, "Path to write into txt file", sep="\t")


#Binding Republican CSV into 1 text file:-
tweet_6<-read.csv("Path to read csv")
tweet_6_df<-select(tweet_6,text)
#total_text_r<-data.frame()
#rm(total_text_r)
total_text_r<-rbind(total_text_r,tweet_6_df)

write.table(total_text_r, "Path to write into txt file", sep="\t")


#Binding HealthCare CSV into 1 text file:-
tweet_7<-read.csv("Path to read csv")
tweet_7_df<-select(tweet_7,text)
#total_text_h<-data.frame()
#rm(total_text_h)
total_text_h<-rbind(total_text_h,tweet_7_df)

write.table(total_text_h, "Path to write into txt file", sep="\t")

#rm(total_text)
#total_text<-data.frame()
total_text<-do.call("rbind", list(total_text_c,total_text_e,total_text_el,total_text_h,total_text_i,total_text_r,total_text_t))
write.table(total_text, "Path to write into txt file", sep="\t")
