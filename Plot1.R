df<-read.table("household_power_consumption.txt",header=TRUE, sep=";") #assumes rxt file is placed in working directory
df[,1]<-as.Date(df[,1],format="%d/%m/%Y")
df1<-subset(df, (Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (Date<=as.Date("2007-02-02","%Y-%m-%d")))
rm("df")
df1<-subset(df1, Global_active_power != "?")
x<-as.numeric(as.character(df1$Global_active_power))

png("Plot1.png",width=480, height=480, units="px")
hist(x, col=2, main="Global Active Power", axes=FALSE, xlab="Global Active Power (kilowatts)")
axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))
axis(2, at=seq(0,1200,by=200), labels=seq(0,1200, by=200))
dev.off()