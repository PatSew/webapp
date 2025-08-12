FROM python:3.12-slim

WORKDIR /app

# Install PostgreSQL client libraries and build tools
RUN apt-get update && apt-get install -y gcc python3-dev libpq-dev && rm -rf /var/lib/apt/lists/*

COPY application/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY application/ .

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["flask", "run"]