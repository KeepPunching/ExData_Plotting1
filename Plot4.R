df<-read.table("household_power_consumption.txt",header=TRUE, sep=";") #assumes rxt file is placed in working directory
df[,1]<-as.Date(df[,1],format="%d/%m/%Y")
df1<-subset(df, (Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (Date<=as.Date("2007-02-02","%Y-%m-%d")))
rm("df")

ap<-as.numeric(as.character(df1$Global_active_power))
v<-as.numeric(as.character(df1$Voltage))
rp<-as.numeric(as.character(df1$Global_reactive_power))


sm1<-as.numeric(as.character(df1$Sub_metering_1))
sm2<-as.numeric(as.character(df1$Sub_metering_2))
sm3<-as.numeric(as.character(df1$Sub_metering_3))

ap<-ap[ap != "?"]
v<-v[v != "?"]
rp<-rp[rp != "?"]

sm1<-sm1[sm1 != "?"]
sm2<-sm2[sm2 != "?"]
sm3<-sm3[sm3 != "?"]

png("Plot4.png",width=480, height=480, units="px")

par(mfrow=c(2,2), mar=c(4,4,1,1))
plot(1:length(ap), ap, ylab="Global Active Power", xlab="", axes= FALSE, type="l")
axis(1, at=c(1,length(ap)/2,length(ap)), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6), labels=c(0,2,4,6))

plot(1:length(v), v, ylab="Voltage", xlab="", axes= FALSE,type="l")
axis(1, at=c(1,length(v)/2,length(v)), labels=c("Thu","Fri","Sat"))
axis(2, at=seq(234,246,by=4), labels=seq(234,246,by=4))

plot(1:length(sm1), sm1,col="black",type="l",axes = FALSE, ,xlab="", ylab="Energy Submetering", ylim=c(0,40))
axis(1, at=c(1,length(sm1)/2,length(sm1)), labels=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30), labels=c(0,10,20,30))
par(new=TRUE)
plot(1:length(sm2),sm2 ,col="red",type="l",axes = FALSE, ,xlab="", ylab="", ylim=c(0,40))
par(new=TRUE)
plot(1:length(sm3), sm3,col="blue",type="l",axes = FALSE, ,xlab="", ylab="", ylim=c(0,40))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"))

plot(1:length(rp), rp, ylab="Global_reactive_power", xlab="", axes= FALSE,type="l")
axis(1, at=c(1,length(rp)/2,length(rp)), labels=c("Thu","Fri","Sat"))
axis(2, at=seq(0.0,0.5,by=0.1), labels=seq(0.0,0.5,by=0.1))

dev.off()