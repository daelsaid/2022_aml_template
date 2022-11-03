#R script to merge movementstats.txt files####
#the working directory should contain a subjectlist (.csv file) including PID,visit,session,run information####

#clear workspace####
rm(list=ls())

#load dplyr package####
if(!require(dplyr)){
    install.packages("dplyr")
}
library(dplyr)

#update working directory and file names####
scriptdir<-getwd()
setwd(dir="/oak/stanford/groups/menon/projects/daelsaid/2019_met/data/imaging/participants")
dir<-getwd()
subjectlist<-'/oak/stanford/groups/menon/projects/daelsaid/2019_met/data/subjectlist/subjectlist.csv'
data_output<-'data_merged.csv'

#create a new folder and copy individual movementstats.txt files####
new.folder <- paste(scriptdir,'/movementstats',sep="")

if (!dir.exists(new.folder)){
dir.create(new.folder)
} else {
    print("movementstats directory already exists!")
}

setwd(scriptdir)
subjects<-read.csv(subjectlist)
subject <-subjects$PID
visit <-subjects$visit
session <-subjects$session
run <-subjects$run

setwd(dir)
setwd(dir = paste(subject[1],'/visit',visit[1],'/session',session[1],'/fmri/',run[1],'/swau_spm12',sep=""))

for (i in 1:length(subject)){
setwd(dir = paste("../../../../../../",subject[i],'/visit',visit[i],'/session',session[i],'/fmri/',run[i],'/swau_spm12',sep=""))
filepath<-getwd()
file_names<-list.files(pattern="MovementStats.txt")
new_names<-paste(as.character(subject[i]),"_",as.character(visit[i]),"_",as.character(session[i]),"_",as.character(run[i]),"_MovementStats.txt",sep="")
file.rename(from=file_names,to=new_names)
list_files<-list.files(pattern="MovementStats.txt")
file.copy(list_files, new.folder)
}

#go to movementstats folder and merge data####
setwd(paste(scriptdir,'/movementstats',sep=""))

for (i in 1:length(subject)){
tab<-read.delim(paste(subject[i],'_',visit[i],'_',session[i],'_',run[i],'_MovementStats.txt',sep=""))
write.csv(tab,paste(subject[i],'_',visit[i],'_',session[i],'_',run[i],'_MovementStats.csv',sep=""),row.names = FALSE)
}

filenames <- list.files(pattern="*.csv")
data_merged <- do.call("rbind", lapply(filenames, read.csv, header = TRUE))
setwd(dir = '..')
data_merged <- data.frame(data_merged[,c(2,4,3,1,5:length(data_merged))])
data_merged<-rename(data_merged,pid=PID,visit=Visit,session=Session,run=TASK,range.x=Range.x,range.y=Range.y,range.z=Range.z,pitch=Range.pitch,roll=Range.roll,yaw=Range.yaw,max.disp=Max.Displacement,max.scan.to.scan.disp=Max.Scan.to.Scan.Displacement,mean.scan.to.scan.disp=Mean.Scan.to.Scan.Displacement,num.scans.greater.than.0.5.vox.disp=Num.Scans...0.5.Voxel.Displacement,num.scans.greater.than.5percent.global.signal=Num.Scans...5..Global.Signal,percent.volumes.repaired=X..of.Volumes.Repaired)
write.csv(data_merged,data_output,row.names = FALSE)
