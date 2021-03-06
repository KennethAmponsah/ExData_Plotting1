if (!"household_power_consumption" %in% ls()) {
  hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  
}

sub_hpc<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))

sub_hpc$Dates<-paste(sub_hpc$Date,sub_hpc$Time)
sub_hpc$Dates<-strptime(sub_hpc$Dates, "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(sub_hpc$Dates, sub_hpc$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub_hpc$Dates, sub_hpc$Sub_metering_2, type="l", col="red")
lines(sub_hpc$Dates, sub_hpc$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()