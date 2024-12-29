FROM python:3.8.6

WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN pip install --upgrade pip
COPY ./requirements.txt /app
RUN pip install -r requirements.txt
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY . /app

EXPOSE 8080
CMD gunicorn HackersFriend_NewsAggregator.wsgi:application --bind 0.0.0.0:8080