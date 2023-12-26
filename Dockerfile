FROM python:3.10
WORKDIR /app
RUN git clone https://github.com/sajib1066/event-calendar.git
WORKDIR /app/event-calendar
RUN apt-get update
RUN apt-get install -y python3-venv
RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
EXPOSE 9000
CMD ["python", "manage.py", "runserver", "0.0.0.0:9000"]
