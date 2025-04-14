FROM python:3.9-slim

WORKDIR /app

# Instala dependências de compilação
RUN apt-get update && \
    apt-get install -y \
    gcc \
    python3-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia APENAS o requirements.txt primeiro
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Copia o resto da aplicação
COPY . .

CMD ["flask", "run", "--host=0.0.0.0"]