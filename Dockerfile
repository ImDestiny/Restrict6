# Use Python 3.12 (Slim Bookworm)
FROM python:3.12-slim-bookworm

# Set working directory
WORKDIR /app

# Install system build dependencies (GCC, Python Dev headers)
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip ensuring you have the latest installer
RUN pip3 install --upgrade pip

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy the rest of your files
COPY . .

# Tell Back4App to open port 8080
EXPOSE 8080

# Run the bot
CMD ["python3", "restrict.py"]
