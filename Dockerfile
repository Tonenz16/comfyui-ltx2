FROM runpod/worker-comfyui:5.4.1-base-cuda12.8.1

RUN comfy-node-install ComfyUI-WanVideoWrapper ComfyUI-VideoHelperSuite
