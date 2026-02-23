FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git wget ffmpeg && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper \
        /workspace/ComfyUI/custom_nodes/ComfyUI-WanVideoWrapper && \
    cd /workspace/ComfyUI/custom_nodes/ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    pip install einops imageio imageio-ffmpeg && \
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite \
        /workspace/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite && \
    cd /workspace/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite && \
    pip install -r requirements.txt && \
    echo "✅ Tutto installato!"
