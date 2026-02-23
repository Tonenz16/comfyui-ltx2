FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git wget && \
    rm -rf /comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI /comfyui && \
    pip install -r /comfyui/requirements.txt && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    cd /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    pip install einops imageio imageio-ffmpeg && \
    echo "✅ Tutto installato!"
