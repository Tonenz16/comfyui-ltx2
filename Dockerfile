FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git && \
    mkdir -p /comfyui/custom_nodes && \
    cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    pip install einops imageio imageio-ffmpeg && \
    ls -la /comfyui/custom_nodes/ && \
    echo "✅ WanVideoWrapper installato in /comfyui/custom_nodes!"
