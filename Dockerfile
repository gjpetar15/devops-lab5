FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip && python3 -m pip install Flask

WORKDIR /app

COPY ./main.py ./
COPY ./index.html ./templates/


ENV PORT=5000

CMD [ "python3", "./main.py"]