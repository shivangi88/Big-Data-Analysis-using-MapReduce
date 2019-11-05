library(rtweet)
library(twitteR)
library(dplyr)
#Binding Trump CSV into 1 text file:-
tweet_1<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_trump_16_4.csv")
tweet_1_df<-select(tweet_1,text)
#total_text_t<-data.frame()
#rm(total_text_t)
total_text_t<-rbind(total_text_t,tweet_1_df)

write.table(total_text_t, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_trump_small.txt", sep="\t")



#Binding Election CSV into 1 text file:8
tweet_2<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_election_16_4.csv")
tweet_2_df<-select(tweet_2,text)
#total_text_el<-data.frame()
#rm(total_text_el)
total_text_el<-rbind(total_text_el,tweet_2_df)

write.table(total_text_el, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_election_small.txt", sep="\t")



#Binding Campaign CSV into 1 text file:-
tweet_3<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_campaign_16_4.csv")
tweet_3_df<-select(tweet_3,text)
#total_text_c<-data.frame()
#rm(total_text_c)
total_text_c<-rbind(total_text_c,tweet_3_df)

write.table(total_text_c, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_campaign_small.txt", sep="\t")


#Binding Immigration CSV into 1 text file:-
tweet_4<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_immigration_16_4.csv")
tweet_4_df<-select(tweet_4,text)
#total_text_i<-data.frame()
#rm(total_text_i)
total_text_i<-rbind(total_text_i,tweet_4_df)

write.table(total_text_i, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_immigration_small.txt", sep="\t")

#Binding Economy CSV into 1 text file:-
tweet_5<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_economy_16_4.csv")
tweet_5_df<-select(tweet_5,text)
#total_text_e<-data.frame()
#rm(total_text_e)
total_text_e<-rbind(total_text_e,tweet_5_df)

write.table(total_text_e, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_economy_small.txt", sep="\t")


#Binding Republican CSV into 1 text file:-
tweet_6<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_republican_16_4.csv")
tweet_6_df<-select(tweet_6,text)
#total_text_r<-data.frame()
#rm(total_text_r)
total_text_r<-rbind(total_text_r,tweet_6_df)

write.table(total_text_r, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_republican_small.txt", sep="\t")


#Binding HealthCare CSV into 1 text file:-
tweet_7<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_hc_16_4.csv")
tweet_7_df<-select(tweet_7,text)
#total_text_h<-data.frame()
#rm(total_text_h)
total_text_h<-rbind(total_text_h,tweet_7_df)

write.table(total_text_h, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_health_small.txt", sep="\t")

#rm(total_text)
#total_text<-data.frame()
total_text<-do.call("rbind", list(total_text_c,total_text_e,total_text_el,total_text_h,total_text_i,total_text_r,total_text_t))
write.table(total_text, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_small.txt", sep="\t")
