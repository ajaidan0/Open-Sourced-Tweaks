/*
 * Aeolus : Aeolus.xm
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

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
    if (![processName isEqualToString:@"com.apple.springboard"]) {
        %init(Tweak);
    }
}
