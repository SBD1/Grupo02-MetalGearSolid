FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

WORKDIR /MetalGearSolid

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/* .

ENTRYPOINT ["python3","main.py"]
