df<-read.table("household_power_consumption.txt",header=TRUE, sep=";") #assumes rxt file is placed in working directory
df[,1]<-as.Date(df[,1],format="%d/%m/%Y")
df1<-subset(df, (Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (Date<=as.Date("2007-02-02","%Y-%m-%d")))
rm("df")

sm1<-as.numeric(as.character(df1$Sub_metering_1))
sm2<-as.numeric(as.character(df1$Sub_metering_2))
sm3<-as.numeric(as.character(df1$Sub_metering_3))

sm1<-sm1[sm1 != "?"]
sm2<-sm2[sm2 != "?"]
sm3<-sm3[sm3 != "?"]
png("Plot3.png",width=480, height=480, units="px")
plot(1:length(sm1), sm1,col="black",type="l",axes = FALSE, ,xlab="", ylab="Energy Submetering", ylim=c(0,40))
axis(1, at=c(1,length(sm1)/2,length(sm1)), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30), labels=c(0,10,20,30))
par(new=TRUE)
plot(1:length(sm2),sm2 ,col="red",type="l",axes = FALSE, ,xlab="", ylab="", ylim=c(0,40))
par(new=TRUE)
plot(1:length(sm3), sm3,col="blue",type="l",axes = FALSE, ,xlab="", ylab="", ylim=c(0,40))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"))
dev.off()