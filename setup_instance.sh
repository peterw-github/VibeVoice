#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting environment setup..."

# 1. Install system dependencies first
apt-get update && apt-get install -y ffmpeg git-lfs
git lfs install

# 2. Install Python dependencies
pip install -e .
pip install gdown

# 3. Download and install the specific flash-attn wheel
# Note: Ensure this file exists in the directory or is reachable via gdown
gdown 1XfRgtl1FHfEBZm73NwTfqvMQrfmlRp4B
pip install flash_attn-2.8.3-cp312-cp312-linux_x86_64.whl

# 4. Install specific library versions
pip install gradio==5.50.0 gradio_client==1.14.0 fastapi==0.118.3 pydantic==2.12.3

# 5. Clone the LoRA weights
git clone https://huggingface.co/peterw-HuggingFace/LoRA_Cortana LoRA_Cortana

echo "Setup complete. Launching Gradio demo..."

# 6. Run the application
python demo/gradio_demo.py --model_path "vibevoice/VibeVoice-7B" --checkpoint_path "LoRA_Cortana/Clone_Small_Alpha128" --share