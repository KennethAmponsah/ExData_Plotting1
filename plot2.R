if (!"household_power_consumption" %in% ls()) {
  hpc<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
  
}

sub_hpc<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))

sub_hpc$Dates<-paste(sub_hpc$Date,sub_hpc$Time)
sub_hpc$Dates<-strptime(sub_hpc$Dates, "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)


plot(sub_hpc$Dates, sub_hpc$Global_active_power, type = "l", ylab="Global Active Power(kilowatts)", xlab = "")

dev.off()