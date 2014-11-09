rplot <- function() {
        
        #read data into table called hpc_table
        hpc_table <- read.table("household_power_consumption.txt", header=TRUE,sep=";")
        #convert date column into date format using strptime()
        hpc_table$Date <- strptime(hpc_table$Date, "%d/%m/%Y")
        
        #subset table for dates of interest: 2-1-2007 and 2-2-2007 into variable hpc_subset
        
        hpc_subset <- hpc_table[hpc_table$Date == "2007-02-01" | hpc_table$Date == "2007-02-02",]
        
        #remove full table from memory
        rm(hpc_table)
        
        #create histogram plot of global active power and write to png device
        
        png("Plot1.png",height=480,width=480)
        
        
        hist(as.numeric(hpc_subset$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
        
        
        dev.off()
        
                                                           
}