#include "STTRootListController.h"

@interface STTSwitchCell : PSSwitchTableCell
-(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha;
@end

@implementation STTSwitchCell {
  UIColor *_switchColor;
}

  -(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier];

    if(self) {
      ((UISwitch *)self.control).onTintColor = [self colorFromHex:[specifier propertyForKey:@"switchColor"] withAlpha:[[specifier propertyForKey:@"switchColorAlpha"] floatValue]];
    }

    return self;
  }

  -(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha {   
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&rgbValue];

    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0 blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0 alpha:alpha];
  }
@end

@implementation STTRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)selectApps {
  SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.ajaidan.scrollsprefs" andKey:@"Apps"];

    [self.navigationController pushViewController:s animated:YES];
	  s.navigationItem.title = @"Select Apps";
    self.navigationItem.hidesBackButton = FALSE;

}

- (void)respring {
  [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=NoMoreScrollstoTop"]];
}

- (void)viewDidLoad {
	[super viewDidLoad];
  UIBarButtonItem *respringButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Apply"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(respring)];
	self.navigationItem.rightBarButtonItem = respringButton;
  STTAppearanceSettings *appearanceSettings = [[STTAppearanceSettings alloc] init];
  self.hb_appearanceSettings = appearanceSettings;
}

@end
