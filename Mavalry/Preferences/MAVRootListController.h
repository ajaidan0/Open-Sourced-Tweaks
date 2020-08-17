#import <Foundation/Foundation.h>
#import <Preferences/PSSwitchTableCell.h>
#import "MAVBaseController.h"

@interface MAVSwitchCell : PSSwitchTableCell
-(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha;
@end

@interface MAVRootListController : MAVBaseController
@property(nonatomic, retain) UIBarButtonItem *respringApplyButton;
@end

@interface Creds : MAVBaseController
@end

@interface SB : MAVBaseController
@end

@interface Lockscreen : MAVBaseController 
@end

@interface Applications : MAVBaseController
@end

@interface Reddit : MAVBaseController
@end

@interface Haptics : MAVBaseController
@end

@interface Reachability : MAVBaseController
@end