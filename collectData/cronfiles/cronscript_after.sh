#!/bin/bash 
#Move environment variables to file for cron use.
declare -p | grep -E 'TZ|FROM|TO_1|TO_2|G_KEY' > /container.env
BASH_ENV=/container.env
/usr/local/bin/Rscript /home/rstudio/commuteR/collectData/scripts/queryAPI_after.R
