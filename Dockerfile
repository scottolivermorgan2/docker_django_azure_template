FROM ubuntu:22.04 AS builder-image

# Catches the output to stdout and cleans and flushes out instantly
ENV PYTHONUNBUFFERED 1

RUN apt-get update \ 
    &&  apt-get install -y python3.10 \ 
    && apt-get install -y python3-pip 

COPY requirements.txt .
COPY . .

RUN pip3 install -r ./requirements.txt

EXPOSE 8080
# Expose these ports on docker virtual network,
# still need to use -p to open/forward these ports on host

CMD ["python3", "manage.py","runserver","0.0.0.0:8080"]