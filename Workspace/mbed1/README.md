# create new project
```
mbed new <PROJECT_NAME>
```

# configure
```
mbed config -G GCC_ARM_PATH "/root/Dependencies/toolchain/bin"
```

# create vscode configuration
```
mbed export -i vscode_gcc_arm -m NUCLEO_F411RE --profile debug
```

# Build
```
mbed compile -m <TARGET> -t <TOOLCHAIN> --flash
mbed compile -m NUCLEO_F411RE -t GCC_ARM -f
```

# Debugging
## issue with debugging "target no recognized"
referrence: [pyOCD Does Not Support STM32F407VGT6 Board](https://github.com/pyocd/pyOCD/issues/1498)
```
pyocd pack update
pyocd pack install <target>
```
## Remarks
- debugger in vscode cant seems to breakpoint on certain portion. will need more time to understand
- debugging with custom board will cause some fault handling error

# TODO
- Address the Debugging and Flash issue on custom board
- Unify mbed-os and place them on External folder which create system link
- create a script that automoted project creation


# Referrences
## Debugging setup
- [Debugging mbed OS applications with Visual Studio Code](https://github.com/ARMmbed/Debugging-docs/blob/master/Docs/Debugging/vscode.md)
- []()

## OpenOCD with Cortex-debug
- [VSCode Cortex-Debug Launch Configurations](https://www.electrorules.com/vscode-cortex-debug-launch-configurations/)