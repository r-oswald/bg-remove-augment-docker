FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/TLI58/bg-remove-augment-docker.git

WORKDIR /app/bg-remove-augment-docker

RUN pip install torch torchvision numpy pillow uvicorn fastapi aiofiles python-multipart scikit-image gdown

WORKDIR /app/bg-remove-augment-docker/webapp/ckpt

RUN gdown 1ao1ovG1Qtx4b7EoskHXmi2E9rp5CHLcZ -O u2net.pth

WORKDIR /app/bg-remove-augment-docker/webapp

RUN mkdir -p images-output

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
