/**
 * ReachOptions : MAVRootListController.h
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSwitchTableCell.h>
#import <Foundation/Foundation.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>
#import <FrontBoardServices/FBSSystemService.h>

@interface MAVRootListController : PSListController
@property(nonatomic, retain) UIBarButtonItem *respringApplyButton;
@end

@interface Creds : PSListController {
}
@end

@interface SB : PSListController {
}
@end

@interface Lockscreen : PSListController {
}
@end
@interface Applications : PSListController {
}
@end

@interface Reddit : PSListController {
}
@end

@interface Haptics : PSListController {
}
@end

@interface Reachability : PSListController {
}
@end