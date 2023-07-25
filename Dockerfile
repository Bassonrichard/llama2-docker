# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# download args
ARG PRESIGNED_URL
ARG MODEL_SIZE

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    ca-certificates \
    libjpeg-dev \
    libpng-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN ./download.sh $PRESIGNED_URL $MODEL_SIZE

# Install any needed packages specified in requirements.txt
RUN pip install -e .

# Run torchrun command when the container launches
#CMD ["python", "chat.py"]
CMD ["torchrun", "--nproc_per_node", "1", "chat_completion.py", "--ckpt_dir", "llama-2-7b-chat/", "--tokenizer_path", "tokenizer.model", "--max_seq_len", "128", "--max_batch_size", "1"]