// NoMoreScrollstoTop v-1.1.1
// Copyright (c) ajaidan0 2020

#import <Cephei/HBPreferences.h>
#import <SparkAppList.h>
#import <UIKit/UIKit.h>

BOOL isEnabled;
BOOL shouldDisableScrollstoTop = FALSE;

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
	HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ajaidan.scrollsprefs"];
	[preferences registerBool:&isEnabled default:FALSE forKey:@"isEnabled"];

    // Thanks, SparkDev!

	NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

    if([SparkAppList doesIdentifier:@"com.ajaidan.scrollsprefs" andKey:@"apps" containBundleIdentifier:bundleIdentifier]) {
		%init (Tweak);
    }
}