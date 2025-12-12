# Use Python 3.12 (Slim Bookworm is newer/smaller than Buster)
FROM python:3.12-slim-bookworm

# Set working directory
WORKDIR /app

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
