# Gunakan base image Python
FROM python:3.11-slim

# Buat direktori kerja di dalam container
WORKDIR /app

# Copy requirements.txt ke container
COPY requirements.txt .

# Install requirements
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Salin folder src dari host ke /app/src di dalam container
COPY src/ /app/src/

# Perintah default saat container dijalankan
CMD ["python"]
