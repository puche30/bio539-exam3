#This script calculates 30 minute averages for NEON temperature data
#Run as Rscript 30min_avg_neon.R [file]

library(tidyverse)
library(lubridate)

args = commandArgs(trailingOnly=TRUE)

filein <- args[1]
#filein <- "NEON_temp-air-buoy/NEON.D03.BARC.DP1.20046.001.2019-01.basic.20190424T185418Z/NEON.D03.BARC.DP1.20046.001.103.100.001.RHbuoy_1min.2019-01.basic.20190424T185418Z.csv"
fileout <- str_replace(filein,".csv","_30minavg.csv")
NEON_1min <- read_csv(filein)

NEON_1min %>%
  group_by(time_interval_start=cut(startDateTime, "15 min")) %>%
  summarise(temp = mean(tempRHMean, na.rm = TRUE)) %>% 
#  ggplot(aes(time_interval_start, temp)) + geom_point()
  write_csv(fileout)

#read_csv(fileout) %>% View()
