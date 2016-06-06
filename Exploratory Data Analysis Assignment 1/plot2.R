# Read data into R
data<-read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
# Format data
data$Datetime = paste(as.character(data[,1]) , data[,2])
data[,1]=as.Date(data$Date,'%d/%m/%Y')
data[,3]=as.numeric(as.character(data[,3]))
# Subset data
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
data$strptime <- strptime(data$Datetime, '%d/%m/%Y %H:%M')
# Plot data
png('plot2.png',width=480,height=480)
plot(data$strptime,data$Global_active_power,ylab='Global Active Power (kilowatts)',xlab='',type='line')
dev.off()
