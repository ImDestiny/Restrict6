# Use Python 3.10
FROM python:3.10.8-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Copy the rest of your files
COPY . .

# THIS IS THE FIX: Tell Back4App to open port 8080
EXPOSE 8080

# Run the bot
CMD ["python3", "restrict_bot.py"]
