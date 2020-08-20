include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ReachOptions

$(TWEAK_NAME)_FILES = $(wildcard *.xm) $(wildcard *.m)
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
