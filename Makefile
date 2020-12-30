clean::
	rm -rf ./*/packages
	rm -rf ./*/.dragon
	rm -rf ./*/build.ninja
	rm -rf ./*/*/.dragon
	rm -rf ./*/*/build.ninja

package::
	rm -rf ./*/packages
	rm -rf ./*/.dragon
	rm -rf ./*/build.ninja
	rm -rf ./*/*/.dragon
	rm -rf ./*/*/build.ninja

do::
	rm -rf ./*/packages
	rm -rf ./*/.dragon
	rm -rf ./*/build.ninja
	rm -rf ./*/*/.dragon
	rm -rf ./*/*/build.ninja

filefix::
	dos2unix ./*/layout/DEBIAN/*
