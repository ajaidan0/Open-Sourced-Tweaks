#import <UIKit/UIDevice.h>
#import <UIKit/UIAlertController.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIPressesEvent.h>

@interface UIDevice (notchedDevice)
@property (nonatomic,readonly) NSString * model;
-(NSString *)model;
-(BOOL)isNotched;
-(BOOL)isAnIpad;
-(BOOL)isAnIpod;
@end
