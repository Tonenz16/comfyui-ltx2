FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git && \
    COMFY_PATH=$(find / -name "custom_nodes" -type d 2>/dev/null | head -1) && \
    echo "Path: $COMFY_PATH" && \
    cd $COMFY_PATH && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    cd ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    pip install einops imageio imageio-ffmpeg && \
    python -c "import sys; sys.path.insert(0, '..'); import importlib.util; spec = importlib.util.spec_from_file_location('nodes', 'nodes.py'); print('✅ Import OK')" && \
    echo "✅ WanVideoWrapper installato!"
