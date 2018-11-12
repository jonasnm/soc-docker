#!/bin/bash

./start-x11vnc.sh

python -m spinup.run test_policy /ds/data/lunar/lunar_s0
