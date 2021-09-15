# commuteR

A project I built to attempt to discover the perfect time to leave for work and leave for home. An endevour slightly complicated by having two work locations.

Idea credit to Dusty Turner: https://github.com/dusty-turner/pcs_drive_time_tracker

The project is built in two parts:

#### collectData
This part is built around a container that runs two cron jobs: one for the morning (into work) and one for the afternoon (going home). The morning cron job runs every five minutes from 0700 to 1000 and reaches out to Google's Distance Matrix API to get the travel time between my home address and my two office addresses. Using this API requires a Google Cloud account and API key. This API key and the addresses are stored in a *.env* file that is loaded into the container at run time. I don't know exactly why but cron jobs don't play nice with environment variables set in docker (and maybe all environment variables) but I had to do some fancy footwork to put the necessary variable values in a file to be read in before the cron job script is executed.

#### displayData
