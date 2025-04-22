# Use official Python image
FROM python:3.11-slim

# Environment variables (optional but good practice)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory inside the container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Run the Flask app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
