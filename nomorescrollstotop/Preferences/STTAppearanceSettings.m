#import "STTRootListController.h"

@implementation STTAppearanceSettings

- (UIColor *)tintColor {

    return [UIColor colorWithRed: 0.74 green: 0.54 blue: 0.98 alpha: 1.00];

}

- (UIColor *)statusBarTintColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarTitleColor {

    return [UIColor whiteColor];

}

- (UIColor *)navigationBarTintColor {

    return [UIColor whiteColor];

}

- (UIColor *)tableViewCellSeparatorColor {

    return [UIColor colorWithWhite:0 alpha:0];

}

- (UIColor *)navigationBarBackgroundColor {

    return [UIColor colorWithRed: 0.74 green: 0.54 blue: 0.98 alpha: 1.00];

}

- (BOOL)translucentNavigationBar {

    return YES;

}

- (NSUInteger)largeTitleStyle {
    return 2;
}

@end