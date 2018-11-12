# Spinning Up (with Docker)
This repository is an attempt to Dockerize [OpenAI's Spinning Up](https://github.com/openai/spinningup)

## What's Working
What I have working is:
1. Setting up dependencies
1. Successfully installing spinup python module
1. Running experiments (e.g. LunarLander-v2)
1. Rendering with Jupyter Notebooks (see /samples/ directory)

## Current Issues
Tracking the following issues:
1. MuJoCo licensing does not work (even with added mjkey.txt -- likely due to activation algo)
1. Rendering test_policy playback
Getting the following when trying to render a test_policy using x11vnc within a container:
```
Logging data to /tmp/experiments/1542008851/progress.txt
Traceback (most recent call last):
  File "/spinningup/spinup/utils/test_policy.py", line 88, in <module>
    run_policy(env, get_action, args.len, args.episodes, not(args.norender))
  File "/spinningup/spinup/utils/test_policy.py", line 56, in run_policy
    env.render()
  File "/usr/local/lib/python3.6/dist-packages/gym/core.py", line 275, in render
    return self.env.render(mode, **kwargs)
  File "/usr/local/lib/python3.6/dist-packages/gym/envs/box2d/lunar_lander.py", line 320, in render
    from gym.envs.classic_control import rendering
  File "/usr/local/lib/python3.6/dist-packages/gym/envs/classic_control/rendering.py", line 23, in <module>
    from pyglet.gl import *
  File "/usr/local/lib/python3.6/dist-packages/pyglet/gl/__init__.py", line 239, in <module>
    import pyglet.window
  File "/usr/local/lib/python3.6/dist-packages/pyglet/window/__init__.py", line 1896, in <module>
    gl._create_shadow_window()
  File "/usr/local/lib/python3.6/dist-packages/pyglet/gl/__init__.py", line 208, in _create_shadow_window
    _shadow_window = Window(width=1, height=1, visible=False)
  File "/usr/local/lib/python3.6/dist-packages/pyglet/window/xlib/__init__.py", line 166, in __init__
    super(XlibWindow, self).__init__(*args, **kwargs)
  File "/usr/local/lib/python3.6/dist-packages/pyglet/window/__init__.py", line 517, in __init__
    raise NoSuchConfigException('No standard config is available.')
pyglet.window.NoSuchConfigException: No standard config is available.
```
