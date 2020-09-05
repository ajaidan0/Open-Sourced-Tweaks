/*
 * NoMoreScrollstoTop : NoMoreScrollstoTop.xm
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

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

	NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

    if([SparkAppList doesIdentifier:@"com.ajaidan.scrollsprefs" andKey:@"apps" containBundleIdentifier:bundleIdentifier]) {
		%init (Tweak);
    }
}