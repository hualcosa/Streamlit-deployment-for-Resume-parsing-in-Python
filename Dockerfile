FROM python:3.7

WORKDIR /app
COPY requirements.txt ./requirements.txt
COPY parser_illustration.png ./parser_illustration.png
COPY app.py ./app.py
ADD ./model ./model
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "app.py"]
