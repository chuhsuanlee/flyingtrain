FROM python:2

WORKDIR /usr/src

## python dependency (requirements.txt)
COPY requirements.txt /usr/src/
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "test.py"]
