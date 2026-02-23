FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git && \
    cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    ls -la ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    echo "✅ WanVideoWrapper installato!"
