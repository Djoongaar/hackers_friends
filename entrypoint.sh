#!/bin/sh

# python manage.py makemigrations --noinput
python manage.py collectstatic
python manage.py migrate
gunicorn HackersFriend_NewsAggregator.wsgi:application --bind 0.0.0.0:8080

exec "$@"