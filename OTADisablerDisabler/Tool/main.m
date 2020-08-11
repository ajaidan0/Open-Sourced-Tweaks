// OTADisablerDisabler
// Copyright (c) ajaidan0 2020

#include <stdio.h>
#include <stdlib.h>
#import <spawn.h>

int main(int argc, const char *argv[]) {
	@autoreleasepool {
		printf("Starting\n");
		char filename[] = "/var/mobile/Library/Preferences/com.apple.MobileAsset.plist";
		remove(filename);
		pid_t pid;
		const char* args[] = {"launchctl", "reboot", "userspace", NULL, NULL};
		posix_spawn(&pid, "/bin/launchctl", NULL, NULL, (char* const*)args, NULL);
	}
	return 0;
}
