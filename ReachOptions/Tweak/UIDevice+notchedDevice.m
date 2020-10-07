#include "UIDevice+notchedDevice.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation UIDevice (notchedDevice)

-(BOOL)isNotched {
    if([self isAnIpod] || [self isAnIpad]) {
        return NO;
    }

    if (@available(iOS 11.0, *)) {
        LAContext *context = [[LAContext alloc] init];
        [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
        return context.biometryType == LABiometryTypeFaceID;
    }

    // Won't get called, as the previous if-statement is always true,
    // As the tweak will only install on iOS 11+
    // The if-statement is there to make the compiler shut up about:
    // LABiometryTypeFaceID only being added in iOS 11
    // The compiler just gets very sad if you don't `return` outside of an if-statement
    return NO;
}

-(BOOL)isAnIpad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

-(BOOL)isAnIpod {
    NSString const *model = [UIDevice.currentDevice model];
    return ([model isEqualToString:@"iPod"]);
}

@end
