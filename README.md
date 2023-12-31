# mbed_development
Mbed development

# pyocd
- [Generic target type](https://pyocd.io/docs/target_support.html#generic_target_type)

# Notes
- At time of writing, mbed1 is tested but not mbed2
- adding new project requires to remove .git in the new workspace folder
- both mbed1 and mbed2 somehow have issue to flash using the default cli command. thus, pyocd is used to flash instead

# SOP
1. very workspace must be based on the hardware! (example: pyboard_v11 or nucleo_f411re)