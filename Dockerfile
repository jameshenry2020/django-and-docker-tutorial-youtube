FROM python:3.8-slim-buster

WORKDIR /app
LABEL key="a simple basic django container"
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y build-essential \
  && apt-get install -y libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt

COPY . .

COPY ./start /start
RUN sed -i 's/\r$//g' /start
RUN chmod +x /start







