/**
 * Aeolus : Aeolus.xm
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import <Foundation/Foundation.h>

%group Tweak
// Hook UITableView
%hook UITableView

-(void)setSeparatorStyle:(long long)arg1 {
    // Run original code, but overwrite arg1
    %orig(0);
}

%end
%end

%ctor {
    // Get current application/process
    NSString *processName = [[%c(NSBundle) mainBundle] bundleIdentifier];
    // If the process isn't SpringBoard, run our code
    if (![processName isEqualToString:@"com.apple.SpringBoard"]) {
        NSLog(@"[AE] INJECTING TWEAK AT %f", [[NSDate date] timeIntervalSince1970]);
        %init(Tweak);
    } else return;
}