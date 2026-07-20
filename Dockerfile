FROM python:3.8-slim-buster

WORKDIR /app

COPY ./src /app/src

COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["python", "src/main.py"]
