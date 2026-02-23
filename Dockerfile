FROM runpod/worker-comfyui:3.1.0-base

# Installa ComfyUI-WanVideoWrapper
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt
