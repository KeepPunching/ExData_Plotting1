df<-read.table("household_power_consumption.txt",header=TRUE, sep=";") #assumes rxt file is placed in working directory
df[,1]<-as.Date(df[,1],format="%d/%m/%Y")
df1<-subset(df, (Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (Date<=as.Date("2007-02-02","%Y-%m-%d")))
rm("df")
df1<-subset(df1, Global_active_power != "?")

y<-as.numeric(as.character(df1$Global_active_power))
png("Plot2.png",width=480, height=480, units="px")
plot(1:length(y), y, axes = FALSE, type="l",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,length(y)/2,length(y)), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6), labels=c(0,2,4,6))
dev.off()