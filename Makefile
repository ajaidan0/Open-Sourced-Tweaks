clean::
	rm -rf ./*/.theos
	rm -rf ./*/packages

package::
	rm -rf ./*/.theos
	rm -rf ./*/packages

do::
	rm -rf ./*/.theos
	rm -rf ./*/packages

filefix::
	dos2unix ./*/layout/DEBIAN/*
