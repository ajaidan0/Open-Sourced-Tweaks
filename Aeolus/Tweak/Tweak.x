// Aeolus
// Copyright (c) ajaidan0 2020

// Create a new class so code can be ran in Swift
@interface AETableView : UITableView
-(void)setSeparatorStyle:(long long)arg1;
@end

// Hook our new class
%hook AETableView
-(void)setSeparatorStyle:(long long)arg1 {
    // Run original code, but overwrite arg1
    %orig(0);
}
%end

%ctor {
    /* 
        * Credits to Nepeta for process exclusion code
        * I do this because on some devices, there is a crash when you use 3D touch on a notification with this tweak installed.
    */

    // Get current application/process
    NSString *processName = [NSProcessInfo processInfo].processName;
    // If the process isn't SpringBoard, replace UITableView with our new class
    if (![processName isEqualToString:@"SpringBoard"]) {
        %init(AETableView=objc_getClass("UITableView"));
    }
}
