## Creation of the database from public available data
##For replication skip to line 176
rm(list=ls())
setwd("~/Downloads")
load(file="2009/familyxx.rda")
load(file="2009/injpoiep.rda")
load(file="2009/personsx.rda")
load(file="2009/samadult.rda")
data1<-cbind.data.frame(NHIS.09.injpoiep.df$hhx, NHIS.09.injpoiep.df$iper)
data2<-cbind.data.frame(NHIS.09.personsx.df$hhx, NHIS.09.personsx.df$sex, NHIS.09.personsx.df$age_p, 
                        NHIS.09.personsx.df$origin_i, NHIS.09.personsx.df$hikindna, 
                        NHIS.09.personsx.df$hikindnb, NHIS.09.personsx.df$hikindnd, 
                        NHIS.09.personsx.df$notcov, NHIS.09.personsx.df$hilast, 
                        NHIS.09.personsx.df$region, NHIS.09.personsx.df$racerpi2, 
                        NHIS.09.personsx.df$hinotyr,NHIS.09.personsx.df$hinotmyr)
data3<-cbind.data.frame(NHIS.09.samadult.df$hhx, NHIS.09.samadult.df$bmi,
                        NHIS.09.samadult.df$smkstat2, NHIS.09.samadult.df$hypev,
                        NHIS.09.samadult.df$dibev, NHIS.09.samadult.df$chdev,
                        NHIS.09.samadult.df$strev, NHIS.09.samadult.df$aasmev,
                        NHIS.09.samadult.df$canev, NHIS.09.samadult.df$ahernoy2, NHIS.09.samadult.df$ahcnoyr2)
data4<-cbind.data.frame(NHIS.09.familyxx.df$hhx, NHIS.09.familyxx.df$fm_educ1,
                        NHIS.09.familyxx.df$fhstatex,NHIS.09.familyxx.df$fhstatvg,
                        NHIS.09.familyxx.df$fhstatg, NHIS.09.familyxx.df$fhstatfr,
                        NHIS.09.familyxx.df$fhstatpr, NHIS.09.familyxx.df$rat_cat2)
head(data3)
colnames(data1)<-c("x","y")
colnames(data2)<-c("x", "sex","age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                   , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2", "ahcnoyr2") 
colnames(data4)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat<-merge(data2,data4, by="x", incomparables = 999, all=T)
newdat<-merge(newdat,data1, by="x", incomparables = 999, all=T)
newdat<-merge(newdat,data3, by="x", incomparables = 999, all=T)
load(file="2008/familyxx.rda")
load(file="2008/injpoiep.rda")
load(file="2008/personsx.rda")
load(file="2008/samadult.rda")
data1.08<-cbind.data.frame(NHIS.08.injpoiep.df$hhx, NHIS.08.injpoiep.df$iper)
data2.08<-cbind.data.frame(NHIS.08.personsx.df$hhx, NHIS.08.personsx.df$sex, NHIS.08.personsx.df$age_p, 
                           NHIS.08.personsx.df$origin_i, NHIS.08.personsx.df$hikindna, 
                           NHIS.08.personsx.df$hikindnb, NHIS.08.personsx.df$hikindnd, 
                           NHIS.08.personsx.df$notcov, NHIS.08.personsx.df$hilast, 
                           NHIS.08.personsx.df$region, NHIS.08.personsx.df$racerpi2, 
                           NHIS.08.personsx.df$hinotyr,NHIS.08.personsx.df$hinotmyr)
data3.08<-cbind.data.frame(NHIS.08.samadult.df$hhx, NHIS.08.samadult.df$bmi,
                           NHIS.08.samadult.df$smkstat2, NHIS.08.samadult.df$hypev,
                           NHIS.08.samadult.df$dibev, NHIS.08.samadult.df$chdev,
                           NHIS.08.samadult.df$strev, NHIS.08.samadult.df$aasmev,
                           NHIS.08.samadult.df$canev, NHIS.08.samadult.df$ahernoy2, NHIS.08.samadult.df$ahcnoyr2)
data4.08<-cbind.data.frame(NHIS.08.familyxx.df$hhx, NHIS.08.familyxx.df$fm_educ1,
                           NHIS.08.familyxx.df$fhstatex,NHIS.08.familyxx.df$fhstatvg,
                           NHIS.08.familyxx.df$fhstatg, NHIS.08.familyxx.df$fhstatfr,
                           NHIS.08.familyxx.df$fhstatpr, NHIS.08.familyxx.df$rat_cat2)
colnames(data1.08)<-c("x","y")
colnames(data2.08)<-c("x", "sex","age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                      , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3.08)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2", "ahcnoyr2") 
colnames(data4.08)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat2<-merge(data2.08,data4.08, by="x", incomparables = 999, all=T)
newdat2<-merge(newdat2,data1.08, by="x", incomparables = 999, all=T)
newdat2<-merge(newdat2,data3.08, by="x", incomparables = 999, all=T)
load(file="2007/familyxx.rda")
load(file="2007/injpoiep.rda")
load(file="2007/personsx.rda")
load(file="2007/samadult.rda")
data1.07<-cbind.data.frame(NHIS.07.injpoiep.df$hhx, NHIS.07.injpoiep.df$iper)
data2.07<-cbind.data.frame(NHIS.07.personsx.df$hhx, NHIS.07.personsx.df$sex,NHIS.07.personsx.df$age_p, 
                           NHIS.07.personsx.df$origin_i, NHIS.07.personsx.df$hikinda, 
                           NHIS.07.personsx.df$hikindb, NHIS.07.personsx.df$hikindd, 
                           NHIS.07.personsx.df$notcov, NHIS.07.personsx.df$hilast, 
                           NHIS.07.personsx.df$region, NHIS.07.personsx.df$racerpi2, 
                           NHIS.07.personsx.df$hinotyr,NHIS.07.personsx.df$hinotmyr)
data3.07<-cbind.data.frame(NHIS.07.samadult.df$hhx, NHIS.07.samadult.df$bmi,
                           NHIS.07.samadult.df$smkstat2, NHIS.07.samadult.df$hypev,
                           NHIS.07.samadult.df$dibev, NHIS.07.samadult.df$chdev,
                           NHIS.07.samadult.df$strev, NHIS.07.samadult.df$aasmev,
                           NHIS.07.samadult.df$canev, NHIS.07.samadult.df$ahernoy2, NHIS.07.samadult.df$ahcnoyr2)
data4.07<-cbind.data.frame(NHIS.07.familyxx.df$hhx, NHIS.07.familyxx.df$fm_educ1,
                           NHIS.07.familyxx.df$fhstatex,NHIS.07.familyxx.df$fhstatvg,
                           NHIS.07.familyxx.df$fhstatg, NHIS.07.familyxx.df$fhstatfr,
                           NHIS.07.familyxx.df$fhstatpr, NHIS.07.familyxx.df$rat_cat2)
colnames(data1.07)<-c("x","y")
colnames(data2.07)<-c("x","sex", "age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                      , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3.07)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2", "ahcnoyr2") 
colnames(data4.07)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat3<-merge(data1.07,data4.07, by.x="x", incomparables=999, all=T)
newdat3<-merge(newdat3,data2.07, by.x="x", incomparables=999, all=T)
newdat3<-merge(newdat3,data3.07, by.x="x", incomparables=999, all=T)
load(file="2006/familyxx.rda")
load(file="2006/injpoiep.rda")
load(file="2006/personsx.rda")
load(file="2006/samadult.rda")
data1.06<-cbind.data.frame(NHIS.06.injpoiep.df$hhx, NHIS.06.injpoiep.df$iper)
data2.06<-cbind.data.frame(NHIS.06.personsx.df$hhx, NHIS.06.personsx.df$sex,NHIS.06.personsx.df$age_p, 
                           NHIS.06.personsx.df$origin_i, NHIS.06.personsx.df$hikinda, 
                           NHIS.06.personsx.df$hikindb, NHIS.06.personsx.df$hikindd, 
                           NHIS.06.personsx.df$notcov, NHIS.06.personsx.df$hilast, 
                           NHIS.06.personsx.df$region, NHIS.06.personsx.df$racerpi2, 
                           NHIS.06.personsx.df$hinotyr,NHIS.06.personsx.df$hinotmyr)
data3.06<-cbind.data.frame(NHIS.06.samadult.df$hhx, NHIS.06.samadult.df$bmi,
                           NHIS.06.samadult.df$smkstat2, NHIS.06.samadult.df$hypev,
                           NHIS.06.samadult.df$dibev, NHIS.06.samadult.df$chdev,
                           NHIS.06.samadult.df$strev, NHIS.06.samadult.df$aasmev,
                           NHIS.06.samadult.df$canev, NHIS.06.samadult.df$ahernoy2, NHIS.06.samadult.df$ahcnoyr2)
data4.06<-cbind.data.frame(NHIS.06.familyxx.df$hhx, NHIS.06.familyxx.df$fm_educ1,
                           NHIS.06.familyxx.df$fhstatex,NHIS.06.familyxx.df$fhstatvg,
                           NHIS.06.familyxx.df$fhstatg, NHIS.06.familyxx.df$fhstatfr,
                           NHIS.06.familyxx.df$fhstatpr, NHIS.06.familyxx.df$rat_cat)
colnames(data1.06)<-c("x","y")
colnames(data2.06)<-c("x","sex", "age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                      , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3.06)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2", "ahcnoyr2") 
colnames(data4.06)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat4<-merge(data1.06,data4.06, by.x="x", incomparables=999, all=T)
newdat4<-merge(newdat4,data2.06, by.x="x", incomparables=999, all=T)
newdat4<-merge(newdat4,data3.06, by.x="x", incomparables=999, all=T)
load(file="2005/familyxx.rda")
load(file="2005/injpoiep.rda")
load(file="2005/personsx.rda")
load(file="2005/samadult.rda")
data1.05<-cbind.data.frame(NHIS.05.injpoiep.df$hhx, NHIS.05.injpoiep.df$iper)
data2.05<-cbind.data.frame(NHIS.05.personsx.df$hhx,NHIS.05.personsx.df$sex ,NHIS.05.personsx.df$age_p, 
                           NHIS.05.personsx.df$origin_i, NHIS.05.personsx.df$hikinda, 
                           NHIS.05.personsx.df$hikindb, NHIS.05.personsx.df$hikindd, 
                           NHIS.05.personsx.df$notcov, NHIS.05.personsx.df$hilast, 
                           NHIS.05.personsx.df$region, NHIS.05.personsx.df$racerpi2, 
                           NHIS.05.personsx.df$hinotyr,NHIS.05.personsx.df$hinotmyr)
data3.05<-cbind.data.frame(NHIS.05.samadult.df$hhx, NHIS.05.samadult.df$bmi,
                           NHIS.05.samadult.df$smkstat2, NHIS.05.samadult.df$hypev,
                           NHIS.05.samadult.df$dibev, NHIS.05.samadult.df$chdev,
                           NHIS.05.samadult.df$strev, NHIS.05.samadult.df$aasmev,
                           NHIS.05.samadult.df$canev, NHIS.05.samadult.df$ahernoy2)
data4.05<-cbind.data.frame(NHIS.05.familyxx.df$hhx, NHIS.05.familyxx.df$fm_educ1,
                           NHIS.05.familyxx.df$fhstatex,NHIS.05.familyxx.df$fhstatvg,
                           NHIS.05.familyxx.df$fhstatg, NHIS.05.familyxx.df$fhstatfr,
                           NHIS.05.familyxx.df$fhstatpr, NHIS.05.familyxx.df$rat_cat)
colnames(data1.05)<-c("x","y")
colnames(data2.05)<-c("x","sex", "age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                      , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3.05)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2", "ahernoy2") 
colnames(data4.05)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat5<-merge(data1.05,data4.05, by.x="x", incomparables=999, all=T)
newdat5<-merge(newdat5,data2.05, by.x="x", incomparables=999, all=T)
newdat5<-merge(newdat5,data3.05, by.x="x", incomparables=999, all=T)
load(file="2004/familyxx.rda")
load(file="2004/injpoiep.rda")
load(file="2004/personsx.rda")
load(file="2004/samadult.rda")
data1.04<-cbind.data.frame(NHIS.04.injpoiep.df$hhx, NHIS.04.injpoiep.df$iper)
data2.04<-cbind.data.frame(NHIS.04.personsx.df$hhx, NHIS.04.personsx.df$sex, NHIS.04.personsx.df$age_p, 
                           NHIS.04.personsx.df$origin_i, NHIS.04.personsx.df$hikinda, 
                           NHIS.04.personsx.df$hikindb, NHIS.04.personsx.df$hikindd, 
                           NHIS.04.personsx.df$notcov, NHIS.04.personsx.df$hilast, 
                           NHIS.04.personsx.df$region, NHIS.04.personsx.df$racerpi2, 
                           NHIS.04.personsx.df$hinotyr,NHIS.04.personsx.df$hinotmyr )
data3.04<-cbind.data.frame(NHIS.04.samadult.df$hhx, NHIS.04.samadult.df$bmi,
                           NHIS.04.samadult.df$smkstat2, NHIS.04.samadult.df$hypev,
                           NHIS.04.samadult.df$dibev, NHIS.04.samadult.df$chdev,
                           NHIS.04.samadult.df$strev, NHIS.04.samadult.df$aasmev,
                           NHIS.04.samadult.df$canev, NHIS.04.samadult.df$ahernoy2)
data4.04<-cbind.data.frame(NHIS.04.familyxx.df$hhx, NHIS.04.familyxx.df$fm_educ1,
                           NHIS.04.familyxx.df$fhstatex,NHIS.04.familyxx.df$fhstatvg,
                           NHIS.04.familyxx.df$fhstatg, NHIS.04.familyxx.df$fhstatfr,
                           NHIS.04.familyxx.df$fhstatpr, NHIS.04.familyxx.df$rat_cat)
colnames(data1.04)<-c("x","y")
colnames(data2.04)<-c("x","sex", "age_p","origin_i" ,"hikindna","hikindnb", "hikindnd"
                      , "notcov" ,"hilast"  ,"region" ,  "racerpi2", "hinotyr","hinotmyr")
colnames(data3.04)<-c("x","bmi", "smkstat2" ,"hypev" , "dibev"  ,  "chdev"   , "strev"   , "aasmev"  , "canev", "ahernoy2") 
colnames(data4.04)<-c("x","fm_educ1","fhstatex" ,"fhstatvg","fhstatg" , "fhstatfr","fhstatpr", "rat_cat2")
newdat6<-merge(data1.04,data4.04, by.x="x", incomparables=999, all=T)
newdat6<-merge(newdat4,data2.04, by.x="x", incomparables=999, all=T)
newdat6<-merge(newdat4,data3.04, by.x="x", incomparables=999, all=T)
finaldata<-rbind(newdat,newdat2,newdat3,newdat4)
save(finaldata,file = "replicationpaperdata.RData")
load("replicationpaperdata.RData")

######################################################################################

## Replication paper

## Create the four variables of interest: continuously uninsured, 
## continuously uninsured, newly insured and newly uninsured

head(finaldata)
ncol(finaldata)
nrow(finaldata)

## We replace the NA value by numeric values to avoid errors in the code
finaldata[is.na(finaldata)] <- 999 ##problem in the regression results

## We create the 4 variables continously insured, continuously uninsured,
## newly insured and newly uninsured
head(continuously_insured)
continuously_insured
head(continuously_uninsured)
head(newly_insured)
head()

continuously_insured<-rep(0, nrow(finaldata))
continuously_uninsured<-rep(0, nrow(finaldata))
newly_insured<-rep(0, nrow(finaldata))
newly_uninsured<-rep(0, nrow(finaldata))

## We define continuously insured as:
## insured now (notcov=2) 
## and insured without interruption in the last 12 months (hynotyr=2)

for (i in 1:nrow(finaldata))
  if (finaldata$notcov[i]==2 & finaldata$hinotyr[i]==2) 
  {continuously_insured[i]<-1 }


## We define continuously uninsured as:
## not covered now (notcov=1)
## and not covered in the last year (hilast = 3 or hilast = 4 or hilast =5)

for (i in 1:nrow(finaldata))
  if (finaldata$notcov[i]==1 & (finaldata$hilast[i]==3| finaldata$hilast[i]==4 |finaldata$hilast[i]==5))
  {continuously_uninsured[i]<-1 }

## We define newly insured as:
## insured now (notcov=1)
## and not covered in the last year (hilast = 3 or hilast = 4 or hilast =5)

for (i in 1:nrow(finaldata))
  if (finaldata$notcov[i]==2 & finaldata$hinotyr[i]==1) 
  {newly_insured[i]<-1 }

## We define newly uninsured as:
## not insured now (notcov=1)
## and covered at some point in the last year (hilast = 1 or hilast =2)

for (i in 1:nrow(finaldata))
  if (finaldata$notcov[i]==1 & (finaldata$hilast[i]==1 |finaldata$hilast[i]==2) )
{newly_uninsured[i]<-1 }

data<-cbind(finaldata, continuously_insured,continuously_uninsured,newly_insured,newly_uninsured)

## Create variable Other kind of insurance
other_kind<-rep(0, nrow(data))

for (i in 1:nrow(data))
  if (finaldata$notcov[i]==2 & data$hikindna[i]==2 & data$hikindnb[i]==2 & data$hikindnd[i]==2) 
  {other_kind[i]<-1 }

## Create variable medicare only

medicare_only<-rep(0, nrow(data))

for (i in 1:nrow(finaldata))
  if (data$hikindnb[i]==1 & data$hikindnd[i]==2 & data$hikindna[i]==2) 
  {medicare_only[i]<-1 }

data<-cbind(data, other_kind, medicare_only)

######################################################################################

#Table 1

tab<-(matrix(NA,nrow=37,ncol=4))
colnames(tab) <- c("Continuously Insured", "Continuously Uninsured", "Newly Insured", "Newly Uninsured")
rownames(tab) <- c("Age 18-44","Age 45-64","Age 65+","Female Sex", "Hispanic Origin", "white",
                   "black", "asian", "Region-Northeast","Midwest", "South", "West","Poverty Ratio <1",
                   "1-1.99", "2-3.9", "+4","Unknown", "Education less than high school graduate",
                   "high school graduate","Some College", "College Grad+","Health Status V Good, Excellent",
                   "Good","Fair/Poor", "BMI < 20", "20-24.9", "25-29.9", ">30", "Smoking- Never",
                   "Current", "Former", "Hypertension", "Diabetes", "Heart Disease","Stroke",
                   "Asthma", "Cancer")
##age 18-44
tab[1,1]<-mean(data$age_p[data$continuously_insured==1]>=18 & data$age_p[data$continuously_insured==1] <=44)
tab[1,2]<-mean(data$age_p[data$continuously_uninsured==1]>=18 & data$age_p[data$continuously_uninsured==1] <=44)
tab[1,3]<-mean(data$age_p[data$newly_insured==1]>=18 & data$age_p[data$newly_insured==1] <=44)
tab[1,4]<-mean(data$age_p[data$newly_uninsured==1]>=18 & data$age_p[data$newly_uninsured==1] <=44)
#age 45-64
tab[2,1]<-mean(data$age_p[data$continuously_insured==1]>=45 & data$age_p[data$continuously_insured==1] <=64)
tab[2,2]<-mean(data$age_p[data$continuously_uninsured==1]>=45 & data$age_p[data$continuously_uninsured==1] <=64)
tab[2,3]<-mean(data$age_p[data$newly_insured==1]>=45 & data$age_p[data$newly_insured==1] <=64)
tab[2,4]<-mean(data$age_p[data$newly_uninsured==1]>=45 & data$age_p[data$newly_uninsured==1] <=64)
#age 65+
tab[3,1]<-mean(data$age_p[data$continuously_insured==1]>=65)
tab[3,2]<-mean(data$age_p[data$continuously_uninsured==1]>=65 )
tab[3,3]<-mean(data$age_p[data$newly_insured==1]>=65)
tab[3,4]<-mean(data$age_p[data$newly_uninsured==1]>=65)
##sex
tab[4,1]<-mean(data$sex[data$continuously_insured==1])-1
tab[4,2]<-mean(data$sex[data$continuously_uninsured==1])-1
tab[4,3]<-mean(data$sex[data$newly_insured==1])-1
tab[4,4]<-mean(data$sex[data$newly_uninsured==1])-1
#Race
#hispanic
tab[5,1]<-mean(data$origin_i[data$continuously_insured==1]==1)
tab[5,2]<-mean(data$origin_i[data$continuously_uninsured==1]==1)
tab[5,3]<-mean(data$origin_i[data$newly_insured==1]==1)
tab[5,4]<-mean(data$origin_i[data$newly_uninsured==1]==1)
#white
tab[6,1]<-mean(data$racerpi2[data$continuously_insured==1]==1)
tab[6,2]<-mean(data$racerpi2[data$continuously_uninsured==1]==1)
tab[6,3]<-mean(data$racerpi2[data$newly_insured==1]==1)
tab[6,4]<-mean(data$racerpi2[data$newly_uninsured==1]==1)
#black
tab[7,1]<-mean(data$racerpi2[data$continuously_insured==1]==2)
tab[7,2]<-mean(data$racerpi2[data$continuously_uninsured==1]==2)
tab[7,3]<-mean(data$racerpi2[data$newly_insured==1]==2)
tab[7,4]<-mean(data$racerpi2[data$newly_uninsured==1]==2)
#asian
tab[8,1]<-mean(data$racerpi2[data$continuously_insured==1]==4)
tab[8,2]<-mean(data$racerpi2[data$continuously_uninsured==1]==4)
tab[8,3]<-mean(data$racerpi2[data$newly_insured==1]==4)
tab[8,4]<-mean(data$racerpi2[data$newly_uninsured==1]==4)
#Region
#Northeast
tab[9,1]<-mean(data$region[data$continuously_insured==1]==1)
tab[9,2]<-mean(data$region[data$continuously_uninsured==1]==1)
tab[9,3]<-mean(data$region[data$newly_insured==1]==1)
tab[9,4]<-mean(data$region[data$newly_uninsured==1]==1)
#midwest
tab[10,1]<-mean(data$region[data$continuously_insured==1]==2)
tab[10,2]<-mean(data$region[data$continuously_uninsured==1]==2)
tab[10,3]<-mean(data$region[data$newly_insured==1]==2)
tab[10,4]<-mean(data$region[data$newly_uninsured==1]==2)
#South
tab[11,1]<-mean(data$region[data$continuously_insured==1]==3)
tab[11,2]<-mean(data$region[data$continuously_uninsured==1]==3)
tab[11,3]<-mean(data$region[data$newly_insured==1]==3)
tab[11,4]<-mean(data$region[data$newly_insured==1]==3)
#west
tab[12,1]<-mean(data$region[data$continuously_insured==1]==4)
tab[12,2]<-mean(data$region[data$continuously_uninsured==1]==4)
tab[12,3]<-mean(data$region[data$newly_insured==1]==4)
tab[12,4]<-mean(data$region[data$newly_uninsured==1]==4)
#poverty ratio
#less than 1
tab[13,1]<-mean(data$rat_cat2[data$continuously_insured==1]==1|data$rat_cat2[data$continuously_insured==1]==2|data$rat_cat2[data$continuously_insured==1]==3|data$rat_cat2[data$continuously_insured==1]==15)
tab[13,2]<-mean(data$rat_cat2[data$continuously_uninsured==1]==1|data$rat_cat2[data$continuously_uninsured==1]==2|data$rat_cat2[data$continuously_uninsured==1]==3|data$rat_cat2[data$continuously_uninsured==1]==15)
tab[13,3]<-mean(data$rat_cat2[data$newly_insured==1]==1|data$rat_cat2[data$newly_insured==1]==2|data$rat_cat2[data$newly_insured==1]==3|data$rat_cat2[data$newly_insured==1]==15)
tab[13,4]<-mean(data$rat_cat2[data$newly_uninsured==1]==1|data$rat_cat2[data$newly_uninsured==1]==2|data$rat_cat2[data$newly_uninsured==1]==3|data$rat_cat2[data$newly_uninsured==1]==15)
#1-1.99
tab[14,1]<-mean(data$rat_cat2[data$continuously_insured==1]==4|data$rat_cat2[data$continuously_insured==1]==5|data$rat_cat2[data$continuously_insured==1]==6|data$rat_cat2[data$continuously_insured==1]==7|data$rat_cat2[data$continuously_insured==1]==16)
tab[14,2]<-mean(data$rat_cat2[data$continuously_uninsured==1]==4|data$rat_cat2[data$continuously_uninsured==1]==5|data$rat_cat2[data$continuously_uninsured==1]==6|data$rat_cat2[data$continuously_uninsured==1]==7|data$rat_cat2[data$continuously_uninsured==1]==16)
tab[14,3]<-mean(data$rat_cat2[data$newly_insured==1]==4|data$rat_cat2[data$newly_insured==1]==5|data$rat_cat2[data$newly_insured==1]==6|data$rat_cat2[data$newly_insured==1]==7|data$rat_cat2[data$newly_insured==1]==16)
tab[14,4]<-mean(data$rat_cat2[data$newly_uninsured==1]==4|data$rat_cat2[data$newly_uninsured==1]==5|data$rat_cat2[data$newly_uninsured==1]==6|data$rat_cat2[data$newly_uninsured==1]==7|data$rat_cat2[data$newly_uninsured==1]==16)
#2-3.9
tab[15,1]<-mean(data$rat_cat2[data$continuously_insured==1]==8|data$rat_cat2[data$continuously_insured==1]==9|data$rat_cat2[data$continuously_insured==1]==10|data$rat_cat2[data$continuously_insured==1]==11)
tab[15,2]<-mean(data$rat_cat2[data$continuously_uninsured==1]==8|data$rat_cat2[data$continuously_uninsured==1]==9|data$rat_cat2[data$continuously_uninsured==1]==10|data$rat_cat2[data$continuously_uninsured==1]==11)
tab[15,3]<-mean(data$rat_cat2[data$newly_insured==1]==8|data$rat_cat2[data$newly_insured==1]==9|data$rat_cat2[data$newly_insured==1]==10|data$rat_cat2[data$newly_insured==1]==11)
tab[15,4]<-mean(data$rat_cat2[data$newly_uninsured==1]==8|data$rat_cat2[data$newly_uninsured==1]==9|data$rat_cat2[data$newly_uninsured==1]==10|data$rat_cat2[data$newly_uninsured==1]==11)
#+4
tab[16,1]<-mean(data$rat_cat2[data$continuously_insured==1]==12|data$rat_cat2[data$continuously_insured==1]==13|data$rat_cat2[data$continuously_insured==1]==14)
tab[16,2]<-mean(data$rat_cat2[data$continuously_uninsured==1]==12|data$rat_cat2[data$continuously_uninsured==1]==13|data$rat_cat2[data$continuously_uninsured==1]==14)
tab[16,3]<-mean(data$rat_cat2[data$newly_insured==1]==12|data$rat_cat2[data$newly_insured==1]==13|data$rat_cat2[data$newly_insured==1]==14)
tab[16,4]<-mean(data$rat_cat2[data$newly_uninsured==1]==12|data$rat_cat2[data$newly_uninsured==1]==13|data$rat_cat2[data$newly_uninsured==1]==14)
#Unknown
tab[17,1]<-mean(data$rat_cat2[data$continuously_insured==1]==17|data$rat_cat2[data$continuously_insured==1]==96|data$rat_cat2[data$continuously_insured==1]==99)
tab[17,2]<-mean(data$rat_cat2[data$continuously_uninsured==1]==17|data$rat_cat2[data$continuously_uninsured==1]==96|data$rat_cat2[data$continuously_uninsured==1]==99)
tab[17,3]<-mean(data$rat_cat2[data$newly_insured==1]==17|data$rat_cat2[data$newly_insured==1]==96|data$rat_cat2[data$newly_insured==1]==99)
tab[17,4]<-mean(data$rat_cat2[data$newly_uninsured==1]==17|data$rat_cat2[data$newly_uninsured==1]==96|data$rat_cat2[data$newly_uninsured==1]==99)
#Education
#less than high school graduate
tab[18,1]<-mean(data$fm_educ1[data$continuously_insured==1]==1|data$fm_educ1[data$continuously_insured==1]==2|data$fm_educ1[data$continuously_insured==1]==3)
tab[18,2]<-mean(data$fm_educ1[data$continuously_uninsured==1]==1|data$fm_educ1[data$continuously_uninsured==1]==2|data$fm_educ1[data$continuously_uninsured==1]==3)
tab[18,3]<-mean(data$fm_educ1[data$newly_insured==1]==1|data$fm_educ1[data$newly_insured==1]==2|data$fm_educ1[data$newly_insured==1]==3)
tab[18,4]<-mean(data$fm_educ1[data$newly_uninsured==1]==1|data$fm_educ1[data$newly_uninsured==1]==2|data$fm_educ1[data$newly_uninsured==1]==3)
#high school graduate
tab[19,1]<-mean(data$fm_educ1[data$continuously_insured==1]==4)
tab[19,2]<-mean(data$fm_educ1[data$continuously_uninsured==1]==4)
tab[19,3]<-mean(data$fm_educ1[data$newly_insured==1]==4)
tab[19,4]<-mean(data$fm_educ1[data$newly_uninsured==1]==4)
#Some college
tab[20,1]<-mean(data$fm_educ1[data$continuously_insured==1]==5|data$fm_educ1[data$continuously_insured==1]==6|data$fm_educ1[data$continuously_insured==1]==7)
tab[20,2]<-mean(data$fm_educ1[data$continuously_uninsured==1]==5|data$fm_educ1[data$continuously_uninsured==1]==6|data$fm_educ1[data$continuously_uninsured==1]==7)
tab[20,3]<-mean(data$fm_educ1[data$newly_insured==1]==5|data$fm_educ1[data$newly_insured==1]==6|data$fm_educ1[data$newly_insured==1]==7)
tab[20,4]<-mean(data$fm_educ1[data$newly_uninsured==1]==5|data$fm_educ1[data$newly_uninsured==1]==6|data$fm_educ1[data$newly_uninsured==1]==7)
#Graduate college+
tab[21,1]<-mean(data$fm_educ1[data$continuously_insured==1]==8|data$fm_educ1[data$continuously_insured==1]==9)
tab[21,2]<-mean(data$fm_educ1[data$continuously_uninsured==1]==8|data$fm_educ1[data$continuously_uninsured==1]==9)
tab[21,3]<-mean(data$fm_educ1[data$newly_insured==1]==8|data$fm_educ1[data$newly_insured==1]==9)
tab[21,4]<-mean(data$fm_educ1[data$newly_uninsured==1]==8|data$fm_educ1[data$newly_uninsured==1]==9)
#Health Status
#excellent/verygood
tab[22,1]<-sum(data$fhstatex[data$continuously_insured==1]+data$fhstatvg[data$continuously_insured==1])/sum(data$fhstatex[data$continuously_insured==1]+data$fhstatvg[data$continuously_insured==1]+data$fhstatg[data$continuously_insured==1]+data$fhstatfr[data$continuously_insured==1]+data$fhstatpr[data$continuously_insured==1])
tab[22,2]<-sum(data$fhstatex[data$continuously_uninsured==1]+data$fhstatvg[data$continuously_uninsured==1])/sum(data$fhstatex[data$continuously_uninsured==1]+data$fhstatvg[data$continuously_uninsured==1]+data$fhstatg[data$continuously_uninsured==1]+data$fhstatfr[data$continuously_uninsured==1]+data$fhstatpr[data$continuously_uninsured==1])
tab[22,3]<-sum(data$fhstatex[data$newly_insured==1]+data$fhstatvg[data$newly_insured==1])/sum(data$fhstatex[data$newly_insured==1]+data$fhstatvg[data$newly_insured==1]+data$fhstatg[data$newly_insured==1]+data$fhstatfr[data$newly_insured==1]+data$fhstatpr[data$newly_insured==1])
tab[22,4]<-sum(data$fhstatex[data$newly_uninsured==1]+data$fhstatvg[data$newly_uninsured==1])/sum(data$fhstatex[data$newly_uninsured==1]+data$fhstatvg[data$newly_uninsured==1]+data$fhstatg[data$newly_uninsured==1]+data$fhstatfr[data$newly_uninsured==1]+data$fhstatpr[data$newly_uninsured==1])
#good
tab[23,1]<-sum(data$fhstatg[data$continuously_insured==1])/sum(data$fhstatex[data$continuously_insured==1]+data$fhstatvg[data$continuously_insured==1]+data$fhstatg[data$continuously_insured==1]+data$fhstatfr[data$continuously_insured==1]+data$fhstatpr[data$continuously_insured==1])
tab[23,2]<-sum(data$fhstatg[data$continuously_uninsured==1])/sum(data$fhstatex[data$continuously_uninsured==1]+data$fhstatvg[data$continuously_uninsured==1]+data$fhstatg[data$continuously_uninsured==1]+data$fhstatfr[data$continuously_uninsured==1]+data$fhstatpr[data$continuously_uninsured==1])
tab[23,3]<-sum(data$fhstatg[data$newly_insured==1])/sum(data$fhstatex[data$newly_insured==1]+data$fhstatvg[data$newly_insured==1]+data$fhstatg[data$newly_insured==1]+data$fhstatfr[data$newly_insured==1]+data$fhstatpr[data$newly_insured==1])
tab[23,4]<-sum(data$fhstatg[data$newly_uninsured==1])/sum(data$fhstatex[data$newly_uninsured==1]+data$fhstatvg[data$newly_uninsured==1]+data$fhstatg[data$newly_uninsured==1]+data$fhstatfr[data$newly_uninsured==1]+data$fhstatpr[data$newly_uninsured==1])
#fair/poor
tab[24,1]<-sum(data$fhstatfr[data$continuously_insured==1]+data$fhstatpr[data$continuously_insured==1])/sum(data$fhstatex[data$continuously_insured==1]+data$fhstatvg[data$continuously_insured==1]+data$fhstatg[data$continuously_insured==1]+data$fhstatfr[data$continuously_insured==1]+data$fhstatpr[data$continuously_insured==1])
tab[24,2]<-sum(data$fhstatfr[data$continuously_uninsured==1]+data$fhstatpr[data$continuously_uninsured==1])/sum(data$fhstatex[data$continuously_uninsured==1]+data$fhstatvg[data$continuously_uninsured==1]+data$fhstatg[data$continuously_uninsured==1]+data$fhstatfr[data$continuously_uninsured==1]+data$fhstatpr[data$continuously_uninsured==1])
tab[24,3]<-sum(data$fhstatfr[data$newly_insured==1]+data$fhstatpr[data$newly_insured==1])/sum(data$fhstatex[data$newly_insured==1]+data$fhstatvg[data$newly_insured==1]+data$fhstatg[data$newly_insured==1]+data$fhstatfr[data$newly_insured==1]+data$fhstatpr[data$newly_insured==1])
tab[24,4]<-sum(data$fhstatfr[data$newly_uninsured==1]+data$fhstatpr[data$newly_uninsured==1])/sum(data$fhstatex[data$newly_uninsured==1]+data$fhstatvg[data$newly_uninsured==1]+data$fhstatg[data$newly_uninsured==1]+data$fhstatfr[data$newly_uninsured==1]+data$fhstatpr[data$newly_uninsured==1])
#BMI
#less than 20
tab[25,1]<-mean(data$bmi[data$continuously_insured==1]<=20)
tab[25,2]<-mean(data$bmi[data$continuously_uninsured==1]<=20)
tab[25,3]<-mean(data$bmi[data$newly_insured==1]<=20)
tab[25,4]<-mean(data$bmi[data$newly_uninsured==1]<=20)
#20-24.9
tab[26,1]<-mean(data$bmi[data$continuously_insured==1]>=20 & data$bmi[data$continuously_insured==1]<=24.9)
tab[26,2]<-mean(data$bmi[data$continuously_uninsured==1]>=20 & data$bmi[data$continuously_uninsured==1]<=24.9)
tab[26,3]<-mean(data$bmi[data$newly_insured==1]>=20 & data$bmi[data$newly_insured==1]<=24.9)
tab[26,4]<-mean(data$bmi[data$newly_uninsured==1]>=20 & data$bmi[data$newly_uninsured==1]<=24.9)
#25-29.9
tab[27,1]<-mean(data$bmi[data$continuously_insured==1]>=25 & data$bmi[data$continuously_insured==1]<=29.9)
tab[27,2]<-mean(data$bmi[data$continuously_uninsured==1]>=25 & data$bmi[data$continuously_uninsured==1]<=29.9)
tab[27,3]<-mean(data$bmi[data$newly_insured==1]>=25 & data$bmi[data$newly_insured==1]<=29.9)
tab[27,4]<-mean(data$bmi[data$newly_uninsured==1]>=25 & data$bmi[data$newly_uninsured==1]<=29.9)
#>30
tab[28,1]<-mean(data$bmi[data$continuously_insured==1]>=30 & data$bmi[data$continuously_insured==1]<=94.9)
tab[28,2]<-mean(data$bmi[data$continuously_uninsured==1]>=30 & data$bmi[data$continuously_uninsured==1]<=94.9)
tab[28,3]<-mean(data$bmi[data$newly_insured==1]>=30 & data$bmi[data$newly_insured==1]<=94.9)
tab[28,4]<-mean(data$bmi[data$newly_uninsured==1]>=30 & data$bmi[data$newly_uninsured==1]<=94.9)
#smoking
#never
tab[29,1]<-mean(data$smkstat2[data$continuously_insured==1]==4)
tab[29,2]<-mean(data$smkstat2[data$continuously_uninsured==1]==4)
tab[29,3]<-mean(data$smkstat2[data$newly_insured==1]==4)
tab[29,4]<-mean(data$smkstat2[data$newly_uninsured==1]==4)
#current
tab[30,1]<-mean(data$smkstat2[data$continuously_insured==1]==1|data$smkstat2[data$continuously_insured==1]==2)
tab[30,2]<-mean(data$smkstat2[data$continuously_uninsured==1]==1|data$smkstat2[data$continuously_uninsured==1]==2)
tab[30,3]<-mean(data$smkstat2[data$newly_insured==1]==1|data$smkstat2[data$newly_insured==1]==2)
tab[30,4]<-mean(data$smkstat2[data$newly_uninsured==1]==1|data$smkstat2[data$newly_uninsured==1]==2)
#former
tab[31,1]<-mean(data$smkstat2[data$continuously_insured==1]==3)
tab[31,2]<-mean(data$smkstat2[data$continuously_uninsured==1]==3)
tab[31,3]<-mean(data$smkstat2[data$newly_insured==1]==3)
tab[31,4]<-mean(data$smkstat2[data$newly_uninsured==1]==3)
#Chronic health condition
#hypertension
tab[32,1]<-mean(data$hypev[data$continuously_insured==1]==1)
tab[32,2]<-mean(data$hypev[data$continuously_uninsured==1]==1)
tab[32,3]<-mean(data$hypev[data$newly_insured==1]==1)
tab[32,4]<-mean(data$hypev[data$newly_uninsured==1]==1)
#diabetes
tab[33,1]<-mean(data$dibev[data$continuously_insured==1]==1)
tab[33,2]<-mean(data$dibev[data$continuously_uninsured==1]==1)
tab[33,3]<-mean(data$dibev[data$newly_insured==1]==1)
tab[33,4]<-mean(data$dibev[data$newly_uninsured==1]==1)
#coronary heart disease
tab[34,1]<-mean(data$chdev[data$continuously_insured==1]==1)
tab[34,2]<-mean(data$chdev[data$continuously_uninsured==1]==1)
tab[34,3]<-mean(data$chdev[data$newly_insured==1]==1)
tab[34,4]<-mean(data$chdev[data$newly_uninsured==1]==1)
#Stroke
tab[35,1]<-mean(data$strev[data$continuously_insured==1]==1)
tab[35,2]<-mean(data$strev[data$continuously_uninsured==1]==1)
tab[35,3]<-mean(data$strev[data$newly_insured==1]==1)
tab[35,4]<-mean(data$strev[data$newly_uninsured==1]==1)
#Asthma
tab[36,1]<-mean(data$aasmev[data$continuously_insured==1]==1)
tab[36,2]<-mean(data$aasmev[data$continuously_uninsured==1]==1)
tab[36,3]<-mean(data$aasmev[data$newly_insured==1]==1)
tab[36,4]<-mean(data$aasmev[data$newly_uninsured==1]==1)
#Cancer
tab[37,1]<-mean(data$canev[data$continuously_insured==1]==1)
tab[37,2]<-mean(data$canev[data$continuously_uninsured==1]==1)
tab[37,3]<-mean(data$canev[data$newly_insured==1]==1)
tab[37,4]<-mean(data$canev[data$newly_uninsured==1]==1)

tab
install.packages('xtable')
library(xtable)
xtable(tab, digits=3, caption="Formatted Table") 


####################################################################################

# Table 2

## Column 1: Association between health insurance type and the likelihood of being newly insured

## Probability of being newly insured given Private Health Insurance

length(data$hikindna[data$newly_insured==1 & data$hikindna==1])/length(data$hikindna[data$hikindna==1])
##  0.03908835

## Probability of being newly insured given Medicaid

length(data$hikindnd[data$newly_insured==1 & data$hikindnd==1])/length(data$hikindnd[data$hikindnd==1])
##  0.0767574

## Probability of being newly insured given Medicare only

## number of people with Medicare only
length(data$hikindnb[data$hikindnb==1 & data$hikindnd==2 & data$hikindna==2])
##  18078

## number of people with medicare only and newly insured
length(data$hikindnb[data$hikindnb==1 & data$hikindnd==2 & data$hikindna==2 & newly_insured==1])
## 315

## Probability of being newly insured given Medicare only
315/18078
## 0.01742449

## Probability of being newly insured given other kind of insurance

length(other_kind[other_kind==1])

data<-cbind(data, other_kind)

length(data$other_kind[data$other_kind==1 & data$newly_insured==1])/length(data$other_kind[data$other_kind==1])

##   0.0864292

###############################
  
# Column 2: Odds ratio
  
## Odds ratio Medicaid
  
## Medicaid and newly insured
a<-length(data$hikindnd[data$newly_insured==1 & data$hikindnd==1])

## Medicaid and not newly insured
b<-length(data$hikindnd[data$newly_insured==0 & data$hikindnd==1])

## Private and newly insured
c<-length(data$hikindna[data$newly_insured==1 & data$hikindna==1])

## Private and not newly insured
d<-length(data$hikindna[data$newly_insured==0 & data$hikindna==1])

odds_medicaid<-(a*d)/(b*c) ##  2.04381

## Odds ratio Medicare only

## Medicare only and newly insured
a2<-length(medicare_only[data$newly_insured==1 & medicare_only==1])

## Medicare only and not newly insured
b2<-length(medicare_only[data$newly_insured==0 & medicare_only==1])

## Private and newly insured
c2<-length(data$hikindna[data$newly_insured==1 & data$hikindna==1])

## Private and not newly insured
d2<-length(data$hikindna[data$newly_insured==0 & data$hikindna==1])

odds_medicare_only<-(a2*d2)/(b2*c2) ## 0.4359436

## Odds ratio OLther kind of insurance

## Other kind and newly insured
a3<-length(data$other_kind[data$other_kind==1 & newly_insured==1])

## Other kind and not newly insured
b3<-length(data$other_kind[data$newly_insured==0 & data$other_kind==1])

## Private and newly insured
c3<-length(data$hikindna[data$newly_insured==1 & data$hikindna==1])

## Private and not newly insured
d3<-length(data$hikindna[data$newly_insured==0 & data$hikindna==1])

odds_other_kind<-(a3*d3)/(b3*c3) ##  2.325704


#######################################################################################

## Table 3: ED use by insurance type

## Model 1
install.packages('stargazer')
require(stargazer)

length(data$ahernoy2[data$ahernoy2==2])

data2<-data[!is.na(data$ahernoy2),]

length(data2$ahernoy2[data2$ahernoy2==0])

length(data2$ahernoy2[data2$ahernoy2==1])

length(data2$ahernoy2[data2$ahernoy2==2])

length(data2$ahernoy2[data2$ahernoy2==3])

length(data2$ahernoy2[data2$ahernoy2==4])

length(data2$ahernoy2[data2$ahernoy2==5])

length(data2$ahernoy2[data2$ahernoy2==6])

length(data2$ahernoy2[data2$ahernoy2==7])

length(data2$ahernoy2[data2$ahernoy2==8])

length(data2$ahernoy2[data2$ahernoy2==97])

length(data2$ahernoy2[data2$ahernoy2==98])

length(data2$ahernoy2[data2$ahernoy2==99])


length(data2$ahernoy2[data2$ahernoy2>=1 & data2$hikindna==1])/length(data2$hikindna[data2$hikindna==1])

length(data2$ahernoy2[data2$ahernoy2>=1 & data2$hikindnd==1])/length(data2$hikindnd[data2$hikindnd==1])

length(data2$ahernoy2[data2$ahernoy2>=1 & data2$medicare_only==1])/length(data2$medicare_only[data2$medicare_only==1])

length(data2$ahernoy2[data2$ahernoy2>=1 & data2$other_kind==1])/length(data2$other_kind[data2$other_kind==1])

length(data2$ahernoy2[data2$ahernoy2>=1 & data2$newly_insured==1])/length(data2$newly_insured[data2$newly_insured==1])

length(data2$ahernoy2[data2$ahernoy2>=1 & data2$continuously_insured==1])/length(data2$continuously_insured[data2$continuously_insured==1])


####################################################################################

## REGRESSIONS / NEW WORK

data$ahernoy2[data$ahernoy2==999]<-NA
data2<-data[!is.na(data$ahernoy2),]
data2$ahernoy2

## We want to regress ED use on a series of binary variable where
## 0 means no and 1 means yes

## We recode the variables hikindna, hikindnd so that 
## Private insurance: hikindna=1 / no private insurance: hikindna=0
## Medicaid: hikindnd=1 / no medicaid: hikindnd=0

data2$hikindna[data2$hikindna==2]<-0
data2$hikindna[data2$hikindna==9]<-0
data2$hikindnd[data2$hikindnd==2]<-0
data2$hikindnd[data2$hikindnd==9]<-0

## Medicare_only, other_kind, newly_insured and continuously_insured are already coded 
## as binary variables

## We create a new factor variable with the 4 binary variables
## newly insured, continuously insured, newly uninsured and continuously uninsured
## because these categories are mutually exclusive

ins<-rep(0,length(data2$hikindna))
ins[data2$newly_insured==1]<-1
ins[data2$continuously_insured==1]<-2
ins[data2$newly_uninsured==1]<-3
ins[data2$continuously_uninsured==1]<-4

data2<-cbind(data2,ins)

data2$ins[data2$ins==0]<-NA
data2<-data2[!is.na(data2$ins),]
head(data2)
## We create a new variable visits that is a count variable to replace the categorical
## variable ahernoy2 in order to be able to run the Poisson regression

visits<-rep(0, length(data2$ahernoy2))
data2<-cbind(data2, visits)
data2$visits[data2$ahernoy2==1]<-1
data2$visits[data2$ahernoy2==2]<-sample(2:3, sum(data2$ahernoy2==2), TRUE)
data2$visits[data2$ahernoy2==3]<-sample(4:5, sum(data2$ahernoy2==3), TRUE)
data2$visits[data2$ahernoy2==4]<-sample(6:7, sum(data2$ahernoy2==4), TRUE)
data2$visits[data2$ahernoy2==5]<-sample(8:9, sum(data2$ahernoy2==5), TRUE)
data2$visits[data2$ahernoy2==6]<-sample(10:12, sum(data2$ahernoy2==6), TRUE)
data2$visits[data2$ahernoy2==7]<-sample(13:15, sum(data2$ahernoy2==7), TRUE)
data2$visits[data2$ahernoy2==8]<-sample(16:18,  sum(data2$ahernoy2==8), TRUE)
head(finaldata)

usoED_new <- subset(data2, data2$newly_insured==1 & (data2$ahernoy2<=8 & data2$ahernoy2!=0))
nusoED_new <- subset(data2, data2$newly_insured==1 & data2$ahernoy2==0)
nrow(usoED_new) / (nrow(usoED_new) + nrow(nusoED_new))

CI_ED <- subset(data, data$continuously_insured==1 & (data$ahernoy2<=8 & data$ahernoy2!=0))
CI <- subset(data, data$continuously_insured==1 & data$ahernoy2==0)
totalusoED <- subset(data, data$continuously_insured==1)
usoED/nusoED

nrow(CI_ED) / (nrow(CI) + nrow(CI_ED))
(nrow(totalusoED) - nrow(nusoED) )/ (nrow(totalusoED))

unicos <- unique(data$ahernoy2)
unicos
NI_ED <- subset(data, data$newly_insured==1 & (data$ahernoy2<=8 & data$ahernoy2!=0))
NI <- subset(data, data$newly_insured==1 & data$ahernoy2==0)
nrow(NI_ED) / (nrow(NI_ED) + nrow(NI))


NU_ED <- subset(data, data$newly_uninsured==1 & (data$ahernoy2<=8 & data$ahernoy2!=0))
NU <- subset(data, data$newly_uninsured==1 & data$ahernoy2==0)
nrow(NU_ED) / (nrow(NU_ED) + nrow(NU))

CU_ED <- subset(data, data$continuously_uninsured==1 & (data$ahernoy2<=8 & data$ahernoy2!=0))
CU <- subset(data, data$continuously_uninsured==1 & data$ahernoy2==0)
nrow(CU_ED) / (nrow(CU_ED) + nrow(CU))


head(data$ahernoy2)
## Model 1
reg1<-glm(data2$visits~data2$hikindna+data2$hikindnd+data2$medicare_only+data2$other_kind+ factor(data2$ins), family="poisson")
install.packages('Zelig')
require(Zelig)
data2$ins<-as.factor(data2$ins)
head(data2)
data2$other_kind <- NULL
mod1<-zelig(visits ~ hikindna + hikindnd + medicare_only + other_kind + ins, 
            model="poisson", data=data2)
summary(mod1)
s<-setx(mod1,ins=1:4)

sims<-sim(mod1, s)
res <- t(sapply(sims, function(x) x$stat[[1]] ))
row.names(res) <- NULL
colnames(res) <- c("mean","sd","median","ci.025","ci.975")
install.packages('Hmisc')
require(Hmisc)
bp<-barplot(res[,1], ylim=c(0,.6), main="Count of Average Emergency Room Visits a Year \n with confidence intervals", 
            col=c("plum2","pink","light green","light blue"), las=3,
            names.arg=c("Newly \n Insured", "Cont. \n Insured", "Newly \n Uninsured","Cont. \n Uninsured"))
errbar(bp[,1], res[,1], ,yplus=res[,5], yminus=res[,4], add=T, col="dark grey")
text(bp, 0,  round(res[,1],3), cex=1, pos=3)
sims[[1]]$stat

plot(sims)
stargazer(reg1, out="reg1.html")


####################################################################################

## Physician visit by insurance status

## We create a new variable visits that is a count variable to replace the categorical
## variable ahernoy2 in order to be able to run the Poisson regression

head(data2)

phyvis<-rep(0, length(data2$ahcnoyr2))
data2<-cbind(data2, phyvis)
data2$phyvis[data2$ahcnoyr2==1]<-1
data2$phyvis[data2$ahcnoyr2==2]<-sample(2:3, sum(data2$ahcnoyr2==2), TRUE)
data2$phyvis[data2$ahcnoyr2==3]<-sample(4:5, sum(data2$ahcnoyr2==3), TRUE)
data2$phyvis[data2$ahcnoyr2==4]<-sample(6:7, sum(data2$ahcnoyr2==4), TRUE)
data2$phyvis[data2$ahcnoyr2==5]<-sample(8:9, sum(data2$ahcnoyr2==5), TRUE)
data2$phyvis[data2$ahcnoyr2==6]<-sample(10:12, sum(data2$ahcnoyr2==6), TRUE)
data2$phyvis[data2$ahcnoyr2==7]<-sample(13:15, sum(data2$ahcnoyr2==7), TRUE)
data2$phyvis[data2$ahcnoyr2==8]<-sample(16:18,  sum(data2$ahcnoyr2==8), TRUE)


reg2<-glm(data2$phyvis~data2$hikindna+data2$hikindnd+data2$medicare_only+data2$other_kind+ factor(data2$ins), family="poisson")
stargazer(reg2, out="reg2.html")

#####################################################################################

## Table 4: ED use among uninsured adults by insurance status

## Model 3: ED use by insurance status

reg3<-glm(data2$visits~data2$newly_uninsured+data2$continuously_uninsured+data2$newly_insured + data2$continuously_insured, family="poisson")
stargazer(reg3, out="reg3.html")


## Model 4: physician visits by category (Newly uninsured vs Continuously Uninsured)

reg4<-glm(data2$phyvis~data2$newly_uninsured+data2$continuously_uninsured+data2$newly_insured+data2$continuously_insured, family="poisson")
stargazer(reg4, out="reg4.html")

## Model 5: Regression of ED visits on factor variable hilast 
## duration without insurance

reg5<-glm(data2$visits~ factor(data2$hilast), family="poisson")
stargazer(reg5, out="reg5.html")

## Model 6: Regression of Physician visits on factor variable hilast
## duration without insurance

reg6<-glm(data2$phyvis~ factor(data2$hilast), family="poisson")
stargazer(reg6, out="reg6.html")

##################################################################################

## Creation of a new variable care that sums the total number of visits in
## ED and physician visits

care<-rep(0, length(data2$visits))
care<-data2$visits+data2$phyvis
data2<-cbind(data2, care)

mod2<-zelig(care~hikindna+hikindnd+medicare_only+other_kind+ ins, 
            model="poisson", data=data2)
summary(mod2)
s<-setx(mod2,ins=1:4)

sims2<-sim(mod2, s)
sims2 <- as.data.frame(sims2)
class(sims2)
install.packages('Hmisc')

require(Hmisc)
res2 <- t(sapply(sims2, function(x) x$stat[[1]]))
row.names(res2) <- NULL
colnames(res2) <- c("mean","sd","median","ci.025","ci.975")
bp2<-barplot(res2[,1], ylim=c(0,5), main="Count of Total Medical Visits a Year \n with confidence intervals", 
            col=c("plum2","pink","light green","light blue"), las=3,
            names.arg=c("Newly \n Insured", "Cont. \n Insured", "Newly \n Uninsured","Cont. \n Uninsured"))
errbar(bp2[,1], res2[,1], ,yplus=res2[,5], yminus=res2[,4], add=T, col="dark grey")
text(bp2, 0,  round(res2[,1],3), cex=1, pos=3)


sims2[[1]]$stat
sims2[[2]]$stat
sims2[[3]]$stat
sims2[[4]]$stat

plot(sims2)

###################################################################################

## Creation of table for physician visits

mod3<-zelig(phyvis~hikindna+hikindnd+medicare_only+other_kind+ ins, 
            model="poisson", data=data2)
summary(mod3)
s<-setx(mod3,ins=1:4)

sims3<-sim(mod3, s)
head(sims3)

res3 <- t(sapply(sims3, function(x) x$stat[[1]]))
row.names(res3) <- NULL
colnames(res3) <- c("mean","sd","median","ci.025","ci.975")
bp3<-barplot(res3[,1], ylim=c(0,5), main="Count of Total Physician Visits a Year \n with confidence intervals", 
            col=c("plum2","pink","light green","light blue"), las=3,
            names.arg=c("Newly \n Insured", "Cont. \n Insured", "Newly \n Uninsured","Cont. \n Uninsured"))
errbar(bp3[,1], res3[,1], ,yplus=res3[,5], yminus=res3[,4], add=T, col="dark grey")
text(bp3, 0,  round(res3[,1],3), cex=1, pos=3)
sims2[[1]]$stat
sims2[[2]]$stat
sims2[[3]]$stat
sims2[[4]]$stat

plot(sims3)

################################
bp3<-barplot(res3[,1], ylim=c(0,5), main="Count of ED and Physician Visits a Year \n with confidence intervals", 
            col=c("plum2","pink","light green","light blue"), las=3,
            names.arg=c("Newly \n Insured", "Cont. \n Insured", "Newly \n Uninsured","Cont. \n Uninsured"))
errbar(bp3[,1], res3[,1], ,yplus=res3[,5], yminus=res3[,4], add=T, col="dark grey")
text(bp3, 0,  round(res3[,1],3), cex=1, pos=3)








