FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN pip install "fastapi[standard]"

COPY . .

EXPOSE 8000

CMD ["fastapi", "run", "main.py"]