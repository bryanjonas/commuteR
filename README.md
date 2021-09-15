# commuteR

A project I built to attempt to discover the perfect time to leave for work and leave for home. An endevour slightly complicated by having two work locations.

Idea credit to Dusty Turner: https://github.com/dusty-turner/pcs_drive_time_tracker

The project is built in two parts:

#### collectData
This part is built around a container that runs two cron jobs: one for the morning (into work) and one for the afternoon (going home). The morning cron job runs every five minutes from 0700 to 1000 and reaches out to Google's Distance Matrix API to get the travel time between my home address and my two office addresses. 

Using this API requires a Google Cloud account and API key. This API key and the addresses are stored in a *.env* file that is loaded into the container at run time. I don't know exactly why but cron jobs don't play nice with environment variables set in docker (and maybe all environment variables) but I had to do some fancy footwork to put the necessary variable values in a file to be read in before the cron job script is executed.

The container used for this is based on Rocker's Tidyverse container which actually runs RStudio Server. This is a bit overkill for running an R script but provides an easy way to pull up a GUI to work on the scripts should you need to make any changes.

#### displayData
This part is built around a container that runs a Shiny server to host a Flexdashboard RMarkdown document with Shiny integration to facilitate limited user involvement with the dashboard (pick the day of week to view the data). This container is built on Rocker's Shiny-Verse container but provides an alternate CMD to run the exact dashboard I want (rather than offering a menu of apps). You will also notice that I mount the *shinyapps* folder into the container to allow live modification of the **Rmd** file while I was testing the page.
