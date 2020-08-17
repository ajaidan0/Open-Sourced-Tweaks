/*
 * Mavalry : Mavalry.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <UIKit/UIControl.h>
#import <AudioToolbox/AudioServices.h>
#import <spawn.h>
#import "Prefs.h"

extern NSString *const kCAFilterDestOut;

@interface SBRootFolderView : UIView

- (UIViewController *)todayViewController;

@end

@interface CCUIBaseSliderView : UIView
@property(nonatomic, retain) UILabel *percentLabel;
- (float)value;
@end

@interface CALayer (Private)
@property(nonatomic, retain) NSString *compositingFilter;
@property(nonatomic, assign) BOOL allowsGroupOpacity;
@property(nonatomic, assign) BOOL allowsGroupBlending;
@end

@interface NCNotificationListSectionRevealHintView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end