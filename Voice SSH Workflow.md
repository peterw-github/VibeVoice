<file name="Voice SSH Workflow.md">


### If not using your 'Immortal Version' of the program:

(SSH INTO THE ACTUAL REMOTE COMPUTER. ALSO MAKE SURE AT LEAST 61 GB OF SPACE ON THE REMOTE COMPUTER)


git clone https://github.com/peterw-github/VibeVoice.git


cd VibeVoice


pip install -e .


pip install flash-attn --no-build-isolation


pip install gradio==5.50.0 gradio_client==1.14.0 fastapi==0.118.3 pydantic==2.12.3


apt-get update && apt-get install -y ffmpeg


apt-get update && apt-get install git-lfs -y


git lfs install


git clone https://huggingface.co/peterw-HuggingFace/LoRA_Cortana LoRA_Cortana


cd /VibeVoice


python demo/gradio_demo.py --model_path "vibevoice/VibeVoice-7B" --checkpoint_path "LoRA_Cortana/Clone_Small_Alpha128" --share

(Good settings are CFG=1.3, Voice="Just Keep Your Head Down, - Halo 3", Disable_Clone=False)





### If using the 'Immortal Version' of the program:

rm 03_ENV/my_restored_env/__editable__* 2>/dev/null


apt-get update && apt-get install -y ffmpeg


export PYTHONPATH=$(pwd)/03_ENV/my_restored_env


export PYTHONPATH=$PYTHONPATH:$(pwd)/04_CODE/VibeVoice-main


cd 04_CODE/VibeVoice-main


python demo/gradio_demo.py \
  --model_path "../../01_MODEL" \
  --checkpoint_path "../../02_LORA_ADAPTERS/Clone_Small_Alpha128" \
  --share


</file>
<br/>