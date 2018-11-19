FROM python:2

WORKDIR /usr/src

ENTRYPOINT ["python", "test.py"]
