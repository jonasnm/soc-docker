#!/bin/bash
if [ -Z ${1+x} ];
then
    $1=/ds/data
fi
python -m spinup.run ppo --env LunarLander-v2 --exp_name lunar --epochs 1 --data_dir $1
