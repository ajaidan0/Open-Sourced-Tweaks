clean::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.theos
	$(ECHO_NOTHING)rm -rf ./*/*/.theos

package::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.theos
	$(ECHO_NOTHING)rm -rf ./*/*/.theos

do::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.theos
	$(ECHO_NOTHING)rm -rf ./*/*/.theos

filefix::
	$(ECHO_NOTHING)dos2unix ./*/layout/DEBIAN/*
