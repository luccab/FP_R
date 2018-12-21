install.packages('rbounds')
install.packages('Matching')
install.packages('rgenoud')
install.packages('parallel')
library(rbounds)
library(Matching)
library(rgenoud)
library(Matching)
library(parallel)

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
continuously_insured<-rep(0, nrow(finaldata))
continuously_uninsured<-rep(0, nrow(finaldata))
newly_insured<-rep(0, nrow(finaldata))
newly_uninsured<-rep(0, nrow(finaldata))

## We define continuously insured as:
## insured now (notcov=2) 
## and insured without interruption in the last 12 months (hynotyr=2)

for (i in 1:nrow(finaldata)){
  if (finaldata$notcov[i]==2 & finaldata$hinotyr[i]==2) 
  {continuously_insured[i]<-1 }
}     



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



## REGRESSIONS / NEW WORK

data$ahernoy2[data$ahernoy2==999]<-NA

###  ^^ Replication Ends here ^^------


usoED_new <- subset(data, data$newly_insured==1 & (data$ahernoy2<=8 & data$ahernoy2!=0))
nusoED_new <- subset(data, data$newly_insured==1 & data$ahernoy2==0)
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



aasmev1<-rep(0,length(data$aasmev))
aasmev1[data$aasmev==1]<-1
aasmev1[data$aasmev!=1]<-0
data<-cbind(data,aasmev1)

dibev1<-rep(0,length(data$dibev))
dibev1[data$dibev==1]<-1
dibev1[data$dibev!=1]<-0
data<-cbind(data,dibev1)

hypev1<-rep(0,length(data$hypev))
hypev1[data$hypev==1]<-1
hypev1[data$hypev!=1]<-0
data<-cbind(data,hypev1)

canev1<-rep(0,length(data$canev))
canev1[data$canev==1]<-1
canev1[data$canev!=1]<-0
data<-cbind(data,canev1)

bmi1<-rep(0,length(data$bmi))
bmi1[data$bmi<20]<-0
bmi1[data$bmi>=20 & data$bmi<25]<-1
bmi1[data$bmi>=25 & data$bmi<30]<-2
bmi1[data$bmi>30]<-3
data<-cbind(data, bmi1)

rat_cat21<-rep(0,length(data$rat_cat2))
rat_cat21[(data$rat_cat2<=3) | (data$rat_cat2==15)]<-0
rat_cat21[(data$bmi>3 & data$bmi<=7) | (data$rat_cat2==16)]<-1
rat_cat21[(data$bmi>7 & data$bmi<=11) | (data$rat_cat2==17)]<-2
rat_cat21[data$bmi>11 & data$bmi<=14]<-3
data<-cbind(data, rat_cat21)

fhstatex1<-rep(0,length(data$fhstatex))
fhstatex1[data$fhstatex<5]<-0
fhstatex1[data$fhstatex>=5]<-1
data<-cbind(data, fhstatex1)

fhstatvg1<-rep(0,length(data$fhstatvg))
fhstatvg1[data$fhstatvg<5]<-0
fhstatvg1[data$fhstatvg>=5]<-1
data<-cbind(data, fhstatvg1)

fhstatg1<-rep(0,length(data$fhstatg))
fhstatg1[data$fhstatg<5]<-0
fhstatg1[data$fhstatg>=5]<-1
data<-cbind(data, fhstatg1)

fhstatfr1<-rep(0,length(data$fhstatfr))
fhstatfr1[data$fhstatfr<5]<-0
fhstatfr1[data$fhstatfr>=5]<-1
data<-cbind(data, fhstatfr1)

fhstatpr1<-rep(0,length(data$fhstatpr))
fhstatpr1[data$fhstatpr<5]<-0
fhstatpr1[data$fhstatpr>=5]<-1
data<-cbind(data, fhstatpr1)

fm_educ11<-rep(0,length(data$fm_educ1))
fm_educ11[data$fm_educ1>=1 & data$fm_educ1<4]<-1
fm_educ11[data$fm_educ1==4]<-2
fm_educ11[data$fm_educ1>=5 & data$fm_educ1<=7]<-3
fm_educ11[data$fm_educ1>=8]<-4
fm_educ11[data$fm_educ1>10]<-0
data<-cbind(data, fm_educ11)

age_p1<-rep(0,length(data$age_p))
age_p1[data$age_p<18]<-0
age_p1[data$age_p>=18 & data$age_p<=44]<-1
age_p1[data$age_p>=45 & data$age_p<=64]<-2
age_p1[data$age_p>=65]<-3
data<-cbind(data, age_p1)

data <- subset(data, data$ahernoy2 !=99 & data$ahernoy2 !=98 & data$ahernoy2 !=97 & data$ahernoy2 !='NA'& data$ahernoy2 !=999)

visits<-rep(0,length(data$ahernoy2))
visits[data$ahernoy2>=1]<-1
data<-cbind(data, visits)

ins<-rep(0,length(data$hikindna))
ins[data$newly_insured==1]<-1
ins[data$continuously_insured==1]<-2
ins[data$newly_uninsured==1]<-3
ins[data$continuously_uninsured==1]<-4
data<-cbind(data,ins)
data <- subset(data, data$ins !=0)

data_Insured_treat <- subset(data, data$newly_insured==1)
data_Insured_control <- subset(data, data$continuously_insured==1)

data_Insured_treat <- data_Insured_treat[sample(nrow(data_Insured_treat), 3000), ]
data_Insured_control <- data_Insured_control[sample(nrow(data_Insured_control), 22000), ]
data_Insured <- rbind(data_Insured_treat, data_Insured_control)

Tr_Insured <- rep(0, nrow(data_Insured))
Tr_Insured[which(data_Insured$newly_insured == 1)] <- 1

#----
data_Uninsured_treat <- subset(data, data$newly_uninsured==1)
data_Uninsured_control <- subset(data, data$continuously_uninsured==1)

data_Uninsured_treat <- data_Uninsured_treat[sample(nrow(data_Uninsured_treat), 3000), ]
data_Uninsured_control <- data_Uninsured_control[sample(nrow(data_Uninsured_control), 22000), ]
data_Uninsured <- rbind(data_Uninsured_treat, data_Uninsured_control)

Tr_Uninsured <- rep(0, nrow(data_Uninsured))
Tr_Uninsured[which(data_Uninsured$newly_uninsured == 1)] <- 1


no_cores <- detectCores()-1
cl <- makeCluster(no_cores)


BalanceMat_Insured <- cbind(data_Insured$sex, data_Insured$age_p1,data_Insured$origin_i, data_Insured$region,
                            data_Insured$racerpi2, data_Insured$chdev,
                            data_Insured$strev,  data_Insured$hypev1,  data_Insured$aasmev1,
                            data_Insured$dibev1, data_Insured$canev1, data_Insured$bmi1, data_Insured$rat_cat21,
                            data_Insured$fhstatex1, data_Insured$fhstatvg1, data_Insured$fhstatg1, 
                            data_Insured$fhstatfr1, data_Insured$fhstatpr1, data_Insured$fm_educ11)

BalanceMat_Uninsured <- cbind(data_Uninsured$sex,data_Uninsured$age_p1, data_Uninsured$origin_i, data_Uninsured$region, 
                              data_Uninsured$racerpi2, data_Uninsured$fm_educ11, data_Uninsured$fhstatex1, 
                              data_Uninsured$fhstatvg1, data_Uninsured$fhstatg1, data_Uninsured$fhstatfr1,
                              data_Uninsured$fhstatpr1, data_Uninsured$rat_cat21, data_Uninsured$bmi1, 
                              data_Uninsured$hypev1, data_Uninsured$dibev1, data_Uninsured$chdev, data_Uninsured$strev, 
                              data_Uninsured$aasmev1, data_Uninsured$canev1)


gen_Insured <- GenMatch(Tr=Tr_Insured, X=BalanceMat_Insured, estimand = "ATT", M=1, pop.size=20,max.generations = 50, wait.generations = 13, caliper = 0.2,cluster = cl)


mgen_Insured <- Match(Tr=Tr_Insured, X=BalanceMat_Insured, Weight.matrix=gen_Insured, estimand= "ATT", M=1, caliper = 0.2)
summary(mgen_Insured)


mout_gen_Insured <- MatchBalance(Tr_Insured ~ data_Insured$sex +data_Insured$age_p1+ data_Insured$origin_i +
                                   data_Insured$region+
                                   data_Insured$racerpi2 + data_Insured$rat_cat21  + data_Insured$chdev +
                                   data_Insured$strev +data_Insured$dibev1+data_Insured$hypev1+
                                   data_Insured$bmi1 + data_Insured$rat_cat21+ data_Insured$aasmev1+
                                   data_Insured$fhstatex1+ data_Insured$fhstatvg1+ data_Insured$fhstatg1+
                                   data_Insured$fhstatfr1+ data_Insured$fhstatpr1+ data_Insured$fm_educ11,
                                 match.out = mgen_Insured, nboots=500)

mgen_y_Insured <- Match(Tr=Tr_Insured, X=BalanceMat_Insured,Y = data_Insured$visits, Weight.matrix=gen_Insured, estimand= "ATT", M=1, caliper = 0.2)
summary(mgen_y_Insured)

psens(mgen_y_Insured,Gamma = 1.3,GammaInc = 0.01)
hlsens(mgen_y_Insured,Gamma = 1.3,GammaInc = 0.01, .1)

#-----------

gen_Uninsured <- GenMatch(Tr=Tr_Uninsured, X=BalanceMat_Uninsured, estimand = "ATT", M=1,pop.size=20, max.generations = 50, wait.generations = 13, caliper= 0.2,cluster = cl)

mgen_Uninsured <- Match(Tr=Tr_Uninsured, X=BalanceMat_Uninsured, Weight.matrix=gen_Uninsured, estimand= "ATT", M=1, caliper = 0.2)
summary(mgen_Uninsured)

mout_gen_Uninsured <- MatchBalance(Tr_Uninsured ~ data_Uninsured$sex +data_Uninsured$age_p1+ data_Uninsured$origin_i +
                                     data_Uninsured$region+
                                     data_Uninsured$racerpi2 + data_Uninsured$rat_cat21  + data_Uninsured$chdev +
                                     data_Uninsured$strev +data_Uninsured$dibev1+data_Uninsured$hypev1+
                                     data_Uninsured$bmi1 + data_Uninsured$rat_cat21+ data_Uninsured$aasmev1+
                                     data_Uninsured$fhstatex1+ data_Uninsured$fhstatvg1+ data_Uninsured$fhstatg1+
                                     data_Uninsured$fhstatfr1+ data_Uninsured$fhstatpr1+ data_Uninsured$fm_educ11,
                                   match.out = mgen_Uninsured, nboots=500)

mgen_y_Uninsured <- Match(Tr=Tr_Uninsured, X=BalanceMat_Uninsured,Y = data_Uninsured$visits, Weight.matrix=gen_Uninsured, estimand= "ATT", M=1, caliper = 0.2)
summary(mgen_y_Uninsured)
psens(mgen_y_Uninsured,Gamma = 1.3,GammaInc = 0.01)

#----------
stopCluster(cl)
