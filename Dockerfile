FROM python:3.9-alpine
WORKDIR /MetalGearSolid
COPY src/* .
COPY requirements.txt .
RUN apk add --no-cache --update py3-pip python3-dev libpq-dev build-base bash
RUN pip install -r requirements.txt
RUN rm requirements.txt
ENTRYPOINT ["python3","main.py"]
