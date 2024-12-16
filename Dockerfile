FROM python:3-alpine
LABEL AUTHOR="PPP" ORG="TestDevLab" DESCRIPTION="Docker file for final task"

WORKDIR /app

COPY requirements.txt requirements.txt
COPY app.py app.py

RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 3000

ENTRYPOINT [ "python" ]
CMD [ "app.py" ]

# To build
# docker build -t peterispp/python-greetings-app:latest .

# To run
# docker run peterispp/python-greetings-app:latest -p 1080:3000