#! /bin/bash 
temp="$(nvidia-smi -q -d temperature | awk 'NR==11{printf "%2d", $5}')"
gpu="$(nvidia-smi -q -d utilization | awk 'NR==11{printf "%2d", $3}')"
echo -e "$gpu% [$temp°C]"
