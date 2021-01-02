clean::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/build.ninja
	$(ECHO_NOTHING)rm -rf ./*/*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/*/build.ninja

package::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/build.ninja
	$(ECHO_NOTHING)rm -rf ./*/*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/*/build.ninja

do::
	$(ECHO_NOTHING)rm -rf ./*/packages
	$(ECHO_NOTHING)rm -rf ./*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/build.ninja
	$(ECHO_NOTHING)rm -rf ./*/*/.dragon
	$(ECHO_NOTHING)rm -rf ./*/*/build.ninja

filefix::
	$(ECHO_NOTHING)dos2unix ./*/layout/DEBIAN/*
