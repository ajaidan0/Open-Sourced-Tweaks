/*
 * NoMoreScrollstoTop : NoMoreScrollstoTop.xm
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import "NoMoreScrollstoTop.h"

%group Tweak
%hook UIScrollView

-(id)initWithFrame:(CGRect)frame {
    self = %orig;
    self.scrollsToTop = FALSE;
    return self;
}

-(id)initWithCoder:(id)arg1 {
    self = %orig;
    self.scrollsToTop = FALSE;
    return self;
}

%end
%end

%ctor {

    loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.ajaidan.scrollsprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);

	NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

    if([SparkAppList doesIdentifier:@"com.ajaidan.scrollsprefs" andKey:@"apps" containBundleIdentifier:bundleIdentifier] && isEnabled) {
		%init (Tweak);
    }
}