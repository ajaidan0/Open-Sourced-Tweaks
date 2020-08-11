ARCHS = arm64 arm64e

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Aeolus

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME) = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk