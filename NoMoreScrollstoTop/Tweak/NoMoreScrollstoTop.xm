/**
 * NoMoreScrollstoTop : NoMoreScrollstoTop.xm
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import "NoMoreScrollstoTop.h"

%group Tweak
%hook UIScrollView

-(id)initWithCoder:(id)arg1 {
    self.scrollsToTop = NO;
    return %orig;
}

%end
%end

%ctor {

    loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("xyz.monotrix.scrollsprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);

	NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

    if([SparkAppList doesIdentifier:@"xyz.monotrix.scrollsprefs" andKey:@"apps" containBundleIdentifier:bundleIdentifier] && isEnabled) {
		%init(Tweak);
    }
}