library(rtweet)
library(twitteR)
library(dplyr)

API_key<-"y3xeJOiD32J2ckNMeCHujvcnj"
API_secret<-"N4VuS3zrxYCZH1bGOwRh5hOLdqk4QPCPBv9eSQdTbN7Y5p9jvY"
Access_token<-"831018830570754048-ZiijifGYigp0nW301GIlDI4UWyNvx3e"
Access_secret<-"rY6GHTJji1iq8ZdoF87Dtq1LTKCQkowA4IOgbDhuiETkC"
setup_twitter_oauth(API_key, API_secret, Access_token, Access_secret)


#HealthCare::-
hc<- search_tweets("health care", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
hc_df <- as.data.frame(hc)

extracted_hc_tweets<- select(hc_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_hc_tweets1 <- subset(extracted_hc_tweets , extracted_hc_tweets$country_code == "US")

write.csv(extracted_hc_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_hc_17_4.csv" , row.names = FALSE)



#Republican:-
republican<- search_tweets("republican", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
republican_df <- as.data.frame(republican)

extracted_republican_tweets<- select(republican_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_republican_tweets1 <- subset(extracted_republican_tweets , extracted_republican_tweets$country_code == "US")

write.csv(extracted_republican_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_republican_17_4.csv" , row.names = FALSE)


#TRUMP::-
trump<- search_tweets("trump", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
trump_df <- as.data.frame(trump)

extracted_trump_tweets<- select(trump_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_trump_tweets1 <- subset(extracted_trump_tweets , extracted_trump_tweets$country_code == "US")

write.csv(extracted_trump_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_trump_17_4.csv" , row.names = FALSE)


#Election::-
election<- search_tweets("election", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
election_df <- as.data.frame(election)

extracted_election_tweets<- select(election_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_election_tweets1 <- subset(extracted_election_tweets , extracted_election_tweets$country_code == "US")

write.csv(extracted_election_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_election_17_4.csv" , row.names = FALSE)

#Campaign::-
campaign<- search_tweets("campaign", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
campaign_df <- as.data.frame(campaign)

extracted_campaign_tweets<- select(campaign_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_campaign_tweets1 <- subset(extracted_campaign_tweets , extracted_campaign_tweets$country_code == "US")

write.csv(extracted_campaign_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_campaign_17_4.csv" , row.names = FALSE)



#Immigration::-
immigration<- search_tweets("immigration", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
immigration_df <- as.data.frame(immigration)

extracted_immigration_tweets<- select(immigration_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_immigration_tweets1 <- subset(extracted_immigration_tweets , extracted_immigration_tweets$country_code == "US")

write.csv(extracted_immigration_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_immigration_17_4.csv" , row.names = FALSE)


#Economy::-
economy<- search_tweets("economy", n = 20000, include_rts = FALSE,type = "mixed","lang:en", geocode = lookup_coords("usa"),until="2019-04-18")
economy_df <- as.data.frame(economy)

extracted_economy_tweets<- select(economy_df,text,user_id, screen_name, source ,status_url, place_full_name , country , country_code  , location, created_at)
extracted_economy_tweets1 <- subset(extracted_economy_tweets , extracted_economy_tweets$country_code == "US")

write.csv(extracted_economy_tweets1, "C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_economy_17_4.csv" , row.names = FALSE)




#Binding Trump CSV into 1 text file:-
tweet_1<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_trump_17_4.csv")
tweet_1_df<-select(tweet_1,text)
#total_text_t<-data.frame()
#rm(total_text_t)
total_text_t<-rbind(total_text_t,tweet_1_df)

write.table(total_text_t, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_trump.txt", sep="\t")



#Binding Election CSV into 1 text file:8
tweet_2<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_election_17_4.csv")
tweet_2_df<-select(tweet_2,text)
#total_text_el<-data.frame()
#rm(total_text_el)
total_text_el<-rbind(total_text_el,tweet_2_df)

write.table(total_text_el, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_election.txt", sep="\t")



#Binding Campaign CSV into 1 text file:-
tweet_3<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_campaign_17_4.csv")
tweet_3_df<-select(tweet_3,text)
#total_text_c<-data.frame()
#rm(total_text_c)
total_text_c<-rbind(total_text_c,tweet_3_df)

write.table(total_text_c, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_campaign.txt", sep="\t")


#Binding Immigration CSV into 1 text file:-
tweet_4<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_immigration_17_4.csv")
tweet_4_df<-select(tweet_4,text)
#total_text_i<-data.frame()
#rm(total_text_i)
total_text_i<-rbind(total_text_i,tweet_4_df)

write.table(total_text_i, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_immigration.txt", sep="\t")

#Binding Economy CSV into 1 text file:-
tweet_5<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_economy_17_4.csv")
tweet_5_df<-select(tweet_5,text)
#total_text_e<-data.frame()
#rm(total_text_e)
total_text_e<-rbind(total_text_e,tweet_5_df)

write.table(total_text_e, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_economy.txt", sep="\t")


#Binding Republican CSV into 1 text file:-
tweet_6<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_republican_17_4.csv")
tweet_6_df<-select(tweet_6,text)
#total_text_r<-data.frame()
#rm(total_text_r)
total_text_r<-rbind(total_text_r,tweet_6_df)

write.table(total_text_r, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_republican.txt", sep="\t")


#Binding HealthCare CSV into 1 text file:-
tweet_7<-read.csv("C:\\Users\\yashi\\Downloads\\Spring2019\\DIC\\Lab2\\TwitterData\\tweet_hc_17_4.csv")
tweet_7_df<-select(tweet_7,text)
#total_text_h<-data.frame()
#rm(total_text_h)
total_text_h<-rbind(total_text_h,tweet_7_df)

write.table(total_text_h, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets_health.txt", sep="\t")

#total_text<-data.frame()
total_text<-do.call("rbind", list(total_text_c,total_text_e,total_text_el,total_text_h,total_text_i,total_text_r,total_text_t))
write.table(total_text, "C:/Users/yashi/Downloads/Spring2019/DIC/Lab2/TwitterData/total_tweets.txt", sep="\t")


