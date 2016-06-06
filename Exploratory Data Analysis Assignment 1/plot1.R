# Read data into R
data<-read.table("./data/household_power_consumption.txt",sep = ";",header = TRUE)
# Format data
data[,1]=as.Date(data$Date,'%d/%m/%Y')
data[,3]=as.numeric(as.character(data[,3]))
# Subset data
data = subset(data, Date == '2007-02-01' | Date == '2007-02-02')
# Plot data
png('plot1.png',width=480,height=480)
hist(data[,3],col='red',xlab='Global Active Power (kilowatts)', ylab='Frequency',main='Global Active Power')
dev.off()