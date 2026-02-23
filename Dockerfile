FROM runpod/worker-comfyui:5.2.0-base

# NON toccare /comfyui, installa solo i custom nodes
RUN apt-get update && apt-get install -y git wget ffmpeg && \
    # WanVideoWrapper
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper \
        /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    cd /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    pip install einops imageio imageio-ffmpeg && \
    \
    # VideoHelperSuite (VHS_VideoCombine) ← QUESTO MANCAVA
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite \
        /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    cd /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    pip install -r requirements.txt && \
    \
    echo "✅ Tutto installato!"
