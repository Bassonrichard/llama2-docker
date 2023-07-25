## LLama 2 Docker

This repos is based on LLAMA 2 from Meta. The original repo can be found here:
https://github.com/facebookresearch/llama


### Setup

You need to get the the download link for the LLama model from Meta. You can request the download link here:
https://ai.meta.com/resources/models-and-libraries/llama-downloads/ 

The download link will be emailed to you and you can run the download `5x in 24 hours` before the link expires.

Once you have the download link, you can add it to the `download.sh` file in the `PRESIGNED_URL` variable - it should begin with https://download.llamameta.net


#### Docker commands

Build the image
```bash
    docker build -t llama2:latest .
```

Run the image
```bash
    docker run --gpus all -it --rm llama2:latest
```

#### WSL 

Install NVIDIA Cuda on WSL to interact with GPU:
https://docs.nvidia.com/cuda/wsl-user-guide/index.html