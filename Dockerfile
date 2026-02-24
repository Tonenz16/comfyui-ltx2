FROM runpod/worker-comfyui:5.2.0-base

RUN apt-get update && apt-get install -y git wget ffmpeg && \
    echo '\ndef apply_rope1(x, freqs_cis):\n    x_ = x.to(dtype=freqs_cis.dtype).reshape(*x.shape[:-1], -1, 1, 2)\n    x_out = freqs_cis[..., 0] * x_[..., 0]\n    x_out.addcmul_(freqs_cis[..., 1], x_[..., 1])\n    return x_out.reshape(*x.shape).type_as(x)\n' >> /comfyui/comfy/ldm/flux/math.py && \
    git clone https://github.com/kijai/ComfyUI-WanVideoWrapper \
        /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    cd /comfyui/custom_nodes/ComfyUI-WanVideoWrapper && \
    pip install -r requirements.txt && \
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite \
        /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    cd /comfyui/custom_nodes/ComfyUI-VideoHelperSuite && \
    pip install -r requirements.txt && \
    echo "✅ Tutto installato!"
