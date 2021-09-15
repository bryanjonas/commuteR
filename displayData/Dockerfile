FROM rocker/shiny-verse:latest

RUN R -e "install.packages(c('flexdashboard','plotly'), dependencies=TRUE)"

RUN apt update && apt install -y libxml2

COPY shinyapps/ /shinyapps

WORKDIR /shinyapps/commuteR

EXPOSE 3838

CMD ["R", "-e", "rmarkdown::run('commuteR.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"]
