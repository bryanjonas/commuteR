require(gmapsdistance)
require(lubridate)

home <- Sys.getenv(c("FROM"))
work_1 <- Sys.getenv(c("TO_1"))
work_2 <- Sys.getenv(c("TO_2"))
key <- Sys.getenv(c("G_KEY"))

timedate <-  lubridate::with_tz(lubridate::as_datetime(Sys.time()), tzone = "America/Monterrey")

work_1_min <- gmapsdistance(origin = work_1, 
                            destination = home, 
                            mode = "driving",
                            key = key,
                            departure = "now",
                            traffic_model = "best_guess")$Time

work_2_min <- gmapsdistance(origin = work_2, 
                            destination = home, 
                            mode = "driving",
                            key = key,
                            departure = "now",
                            traffic_model = "best_guess")$Time


work_1_row = cbind(timedate, work_1_min)
work_2_row = cbind(timedate, work_2_min)

write.table(work_1_row,  
             file="/data/work_1_after.csv", 
             append = T, 
             sep=',', 
             row.names=F, 
             col.names=F)

write.table(work_2_row,  
            file="/data/work_2_after.csv", 
            append = T, 
            sep=',', 
            row.names=F, 
            col.names=F)
