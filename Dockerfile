FROM python:3.7.7-slim

RUN mkdir /app
WORKDIR /app

COPY requirements.txt requirements.txt 
RUN pip install -r requirements.txt 

COPY . .

LABEL maintainer="Thiago V. Fernandes <thiagovf.eng@gmail.com>" \
    version="1.0"

EXPOSE 8000

# ENTRYPOINT python app.py

CMD gunicorn -w 1 -b 0.0.0.0:8000 app:server --log-file - --access-logfile - --reload --keep-alive 2
