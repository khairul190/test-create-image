# Gunakan base image Python
FROM python:3.11-slim

# Buat direktori kerja di dalam container
WORKDIR /app

# Copy requirements.txt ke container
COPY requirements.txt /app/requirements.txt


# Install requirements
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

    
# Perintah default saat container dijalankan
CMD ["python"]
