# Read data into R
data<-read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
# Format data
data$Datetime = paste(as.character(data[,1]) , data[,2])
data[,1]=as.Date(data$Date,'%d/%m/%Y')
data[,3]=as.numeric(as.character(data[,3]))
data$Sub_metering_1 <- (as.numeric(as.character(data$Sub_metering_1))) 
data$Sub_metering_2 <- (as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- (as.numeric(as.character(data$Sub_metering_3)))
# Subset data
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data$strptime <- strptime(data$Datetime, '%d/%m/%Y %H:%M')
# Plot data
png('plot3.png',width=480,height=480)
plot(data$strptime,data$Sub_metering_1,ylab='Energy sub metering',xlab='',type='line')
lines(data$strptime,data$Sub_metering_2,col='red')
lines(data$strptime,data$Sub_metering_3,col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1,lwd=1.5)
dev.off()