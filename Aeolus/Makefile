export TARGET := iphone:clang:latest:12.2
export INSTALL_TARGET_PROCESSES = SpringBoard
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Aeolus

Aeolus_FILES = $(shell find Sources/Aeolus -name '*.swift') $(shell find Sources/AeolusC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
Aeolus_SWIFTFLAGS = -ISources/AeolusC/include
Aeolus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
