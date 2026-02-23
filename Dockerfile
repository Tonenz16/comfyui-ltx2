FROM runpod/worker-comfyui:5.5.1-base

RUN COMFY_PATH=$(find / -name "nodes.py" -path "*ComfyUI*" 2>/dev/null | head -1 | xargs dirname) && \
    echo "Found ComfyUI at: $COMFY_PATH" && \
    cd $COMFY_PATH/custom_nodes && \
    wget https://github.com/Lightricks/ComfyUI-LTXVideo/archive/refs/heads/master.zip && \
    python3 -c "import zipfile; zipfile.ZipFile('master.zip').extractall('.')" && \
    mv ComfyUI-LTXVideo-master ComfyUI-LTXVideo && rm master.zip && \
    pip install -r ComfyUI-LTXVideo/requirements.txt && \
    wget https://github.com/kijai/ComfyUI-KJNodes/archive/refs/heads/main.zip && \
    python3 -c "import zipfile; zipfile.ZipFile('main.zip').extractall('.')" && \
    mv ComfyUI-KJNodes-main ComfyUI-KJNodes && rm main.zip && \
    pip install -r ComfyUI-KJNodes/requirements.txt
