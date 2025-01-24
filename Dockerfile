# Gunakan base image Python
FROM python:3.11-slim

# Install PDM
RUN pip install pdm

# Set environment variables untuk PDM
ENV PDM_HOME=/root/.pdm \
    PATH=/root/.pdm/bin:$PATH \
    PDM_IGNORE_SAVED_PYTHON=1

# Buat direktori kerja di dalam container
WORKDIR /app

# Salin file konfigurasi PDM ke dalam container
COPY pyproject.toml pdm.lock ./

# Install dependensi berdasarkan pdm.lock
RUN pdm add --prod --no-editable

# Salin seluruh kode proyek ke dalam container
COPY . .

# Perintah default saat container dijalankan
CMD ["pdm", "run", "python", "app.py"]
