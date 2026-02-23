FROM registry.runpod.net/runpod-workers-worker-comfyui-main-dockerfile:d29f0bc90

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-LTXVideo.git && \
    cd ComfyUI-LTXVideo && \
    pip install -r requirements.txt
