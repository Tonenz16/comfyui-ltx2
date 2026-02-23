FROM runpod/worker-comfyui:5.5.1-base

RUN cd /comfyui/custom_nodes && \
    wget https://github.com/Lightricks/ComfyUI-LTXVideo/archive/refs/heads/master.zip && \
    python3 -c "import zipfile; zipfile.ZipFile('master.zip').extractall('.')" && \
    mv ComfyUI-LTXVideo-master ComfyUI-LTXVideo && \
    rm master.zip && \
    cd ComfyUI-LTXVideo && pip install -r requirements.txt && \
    cd .. && \
    wget https://github.com/kijai/ComfyUI-KJNodes/archive/refs/heads/main.zip && \
    python3 -c "import zipfile; zipfile.ZipFile('main.zip').extractall('.')" && \
    mv ComfyUI-KJNodes-main ComfyUI-KJNodes && \
    rm main.zip && \
    cd ComfyUI-KJNodes && pip install -r requirements.txt
