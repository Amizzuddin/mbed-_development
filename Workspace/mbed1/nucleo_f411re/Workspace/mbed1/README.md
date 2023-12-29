# configure
```
mbed config -G GCC_ARM_PATH "/root/Dependencies/toolchain/bin"
```

# Build
```
mbed compile -m <TARGET> -t <TOOLCHAIN> --flash
mbed compile -m NUCLEO_F411RE -t GCC_ARM -f
```