FROM runpod/worker-comfyui:latest

# Installa ComfyUI-WanVideoWrapper
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt
