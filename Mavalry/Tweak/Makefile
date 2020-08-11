ARCHS = arm64 arm64e
TARGET = iphone:clang::13.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mavalry
$(TWEAK_NAME)_FILES = $(TWEAK_NAME).xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_FRAMEWORKS += AudioToolbox

include $(THEOS_MAKE_PATH)/tweak.mk
