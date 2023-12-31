#!/bin/bash


# step1: execute mbed new (without the need to create mbed-os)

# step2: execute "mbed export -i vscode_gcc_arm -m NUCLEO_F411RE --profile debug" for vscode configuration -> consider to do multi targets perhaps add a tasks.json?

# step3: remove (tasks, setting, launch).json. just leave c_cpp_properties.json

# Copy template such as openocd.cfg, pyocd.yaml

# step x: cd to root of repository

# create symlink to mbed-os folder
ln -rs Externals/mbed-os/* Workspace/mbed1/pyboard_v11/mbed-os