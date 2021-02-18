cd $1
make package -j TARGET=simulator:clang::latest
sudo rm -rf /opt/simject/$1.*
sudo cp ./.theos/obj/iphone_simulator/debug/arm64e/$1.dylib /opt/simject
sudo cp ./Tweak/$1.plist /opt/simject

#if [ -d "./Preferences" ]; then
#    sudo rm -rf /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS14.4.simruntime/Contents/Resources/RuntimeRoot/Library/PreferenceLoader/Preferences/$1Prefs.plist
#    sudo rm -rf /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS14.4.simruntime/Contents/Resources/RuntimeRoot/Library/PreferenceBundles/$1Prefs.bundle
#    mv ./Preferences/entry.plist ./Preferences/$1Prefs.plist
#    sudo cp ./Preferences/$1Prefs.plist /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS14.4.simruntime/Contents/Resources/RuntimeRoot/Library/PreferenceLoader/Preferences
#    mv ./Preferences/$1Prefs.plist ./Preferences/entry.plist
#    sudo mv ./.theos/obj/iphone_simulator/debug/$1Prefs.bundle /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS14.4.simruntime/Contents/Resources/RuntimeRoot/Library/PreferenceBundles
#fi

cd ../
make clean
~/simject/bin/resim