FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git && \
    COMFY_PATH=$(find / -name "custom_nodes" -type d 2>/dev/null | head -1) && \
    echo "ComfyUI custom_nodes trovato in: $COMFY_PATH" && \
    cd $COMFY_PATH && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    echo "✅ WanVideoWrapper installato!"
