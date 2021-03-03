clean::
	$(ECHO_NOTHING)rm -rfv ./*/packages
	$(ECHO_NOTHING)rm -rfv ./*/.theos
	$(ECHO_NOTHING)rm -rfv ./*/*/.theos

package::
	$(ECHO_NOTHING)rm -rfv ./*/packages
	$(ECHO_NOTHING)rm -rfv ./*/.theos
	$(ECHO_NOTHING)rm -rfv ./*/*/.theos

do::
	$(ECHO_NOTHING)rm -rfv ./*/packages
	$(ECHO_NOTHING)rm -rfv ./*/.theos
	$(ECHO_NOTHING)rm -rfv ./*/*/.theos

filefix::
	$(ECHO_NOTHING)dos2unix ./*/layout/DEBIAN/*
