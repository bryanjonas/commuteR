require(gmapsdistance)
require(lubridate)

home <- Sys.getenv(c("FROM"))
work_1 <- Sys.getenv(c("TO_1"))
work_2 <- Sys.getenv(c("TO_2"))
key <- Sys.getenv(c("G_KEY"))

timedate <-  lubridate::with_tz(lubridate::as_datetime(Sys.time()), tzone = "America/Monterrey")

work_1_min <- gmapsdistance(origin = home, 
                            destination = work_1, 
                            mode = "driving",
                            key = key,
                            departure = "now",
                            traffic_model = "best_guess")$Time
work_2_min <- gmapsdistance(origin = home, 
                            destination = work_2, 
                            mode = "driving",
                            key = key,
                            departure = "now",
                            traffic_model = "best_guess")$Time

work_1_row = cbind(timedate, work_1_min)
work_2_row = cbind(timedate, work_2_min)

write.table(work_1_row,  
             file="/home/rstudio/commuteR/work_1_morn.csv", 
             append = T, 
             sep=',', 
             row.names=F, 
             col.names=F)

write.table(work_2_row,  
            file="/home/rstudio/commuteR/work_2_morn.csv", 
            append = T, 
            sep=',', 
            row.names=F, 
            col.names=F)
