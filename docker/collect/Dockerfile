FROM rocker/tidyverse:latest

RUN R -e "install.packages('gmapsdistance')"
RUN apt update && \
    apt install -y cron

COPY ./cronfiles/custom-cron /etc/cron.d/custom-cron

RUN apt install -y nano

RUN chmod 0644 /etc/cron.d/custom-cron

RUN crontab /etc/cron.d/custom-cron    

RUN rm -f /etc/localtime && \
    ln -s /usr/share/zoneinfo/US/Central /etc/localtime

RUN touch /container.env

CMD cron -f
