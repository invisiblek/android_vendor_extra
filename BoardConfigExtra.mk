-include vendor/invisiblek/BoardConfigExtra.mk

ifeq ($(WITH_TWRP),true)
TW_USE_TOOLBOX := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
endif
