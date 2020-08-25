/*
 * April : APRTitleCells.m
 * 
 * Authored by ConstanzeDev and LacertosusDeus (c) 2020 
 * Maintained by ajaidan0 (c) 2020
*/

#import "APRTitleCells.h"
#import "Common.h"
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <PeterDev/libpddokdo.h>

static APRTitleCell *titleCell;

@implementation APRTimeTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 20, width, 50);
		CGRect versionFrame = CGRectMake(22, 60, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:35 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"Time Settings";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Time, your way.";

		[self addSubview:packageNameLabel];
		[self addSubview:versionLabel];
	}
	return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AmeliaTime" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 140.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 140);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = [UIColor systemPinkColor];
	UIColor *bottomColor = [UIColor systemPurpleColor];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end

@implementation APRDateTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 20, width, 50);
		CGRect versionFrame = CGRectMake(22, 60, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:35 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"Date Settings";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Date, personalized.";

		[self addSubview:packageNameLabel];
		[self addSubview:versionLabel];
	}
	return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AmeliaDate" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 140.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 140);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = [UIColor systemRedColor];
	UIColor *bottomColor = [UIColor systemOrangeColor];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end

@implementation APRWeatherTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 20, width, 50);
		CGRect versionFrame = CGRectMake(22, 60, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:35 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"Weather Settings";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Weather, from your lockscreen.";

		[self addSubview:packageNameLabel];
		[self addSubview:versionLabel];
	}
	return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AmeliaWeather" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 140.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 140);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = [UIColor systemBlueColor];
	UIColor *bottomColor = [UIColor systemPurpleColor];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end

@implementation APREventTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 20, width, 50);
		CGRect versionFrame = CGRectMake(22, 60, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:35 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"Calendar Settings";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:19 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Reminders and Events, made easy.";

		[self addSubview:packageNameLabel];
		[self addSubview:versionLabel];
	}
	return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AmeliaCalendar" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 140.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 140);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = [UIColor systemTealColor];
	UIColor *bottomColor = [UIColor systemGreenColor];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end

@implementation APRFaceIDTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 20, width, 50);
		CGRect versionFrame = CGRectMake(22, 60, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:35 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"FaceID";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Position, Color, Size, Simple.";

		[self addSubview:packageNameLabel];
		[self addSubview:versionLabel];
	}
	return self;
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AmeliaFaceID" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 140.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 140);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = [UIColor colorWithRed:1.f green:189/255.f blue:187/255.f alpha:1.f];
	UIColor *bottomColor = [UIColor colorWithRed:1.f green:129/255.f blue:124/255.f alpha:1.f];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end

void updatePrefs() {
	[titleCell preferencesChanged];
}

@implementation APRTitleCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if(self) {
		int width = self.contentView.bounds.size.width;
		CGRect nameFrame = CGRectMake(20, 90, width, 50);
		CGRect developerFrame = CGRectMake(22, 50, width, 50);
		CGRect versionFrame = CGRectMake(22, 130, width, 50);

		packageNameLabel = [[UILabel alloc] initWithFrame:nameFrame];
		[packageNameLabel setFont:[UIFont systemFontOfSize:50 weight:UIFontWeightSemibold]];
		packageNameLabel.textColor = [UIColor whiteColor];
		packageNameLabel.text = @"April";

		developerLabel = [[UILabel alloc] initWithFrame:developerFrame];
		[developerLabel setFont:[UIFont systemFontOfSize:25 weight:UIFontWeightMedium]];
		developerLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha: 0.85];
		developerLabel.text = @"v2.0.5";

		versionLabel = [[UILabel alloc] initWithFrame:versionFrame];
		[versionLabel setFont:[UIFont systemFontOfSize:22 weight:UIFontWeightMedium]];
		versionLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.85];
		versionLabel.text = @"Much ❤️ From ConstanzeDev";

		[self addSubview:packageNameLabel];
		[self addSubview:developerLabel];
		[self addSubview:versionLabel];
		[self preferencesChanged];
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs, CFSTR("com.constanze.aprilprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	titleCell = self;
	return self;
}

-(void)setAlignment:(int)alignment velocity:(int)velocity {
	[UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:(int)velocity options:UIViewAnimationOptionCurveEaseOut animations:^{
		if(alignment == 0) {
				//Left
			int width = self.contentView.bounds.size.width;
			packageNameLabel.frame = CGRectMake(20, 90, width, 50);
			versionLabel.frame = CGRectMake(22, 50, width, 50);
			developerLabel.frame = CGRectMake(22, 130, width, 50);
		} else if(alignment == 1) {
				//Center
			int width = self.contentView.bounds.size.width;
			int pWidth = packageNameLabel.frame.size.width;
			int vWidth = versionLabel.frame.size.width;
			int dWidth = developerLabel.frame.size.width;
			packageNameLabel.frame = CGRectMoveX(width / 2 - pWidth / 2, packageNameLabel.frame);
			versionLabel.frame = CGRectMoveX(width / 2 - vWidth / 2, versionLabel.frame);
			developerLabel.frame = CGRectMoveX(width / 2 - dWidth / 2, developerLabel.frame);
		} else if(alignment == 2) {
				//Right
			int width = self.frame.size.width;
			int pWidth = packageNameLabel.frame.size.width;
			int vWidth = versionLabel.frame.size.width;
			int dWidth = developerLabel.frame.size.width;
			packageNameLabel.frame = CGRectMoveX(width - pWidth - 20, packageNameLabel.frame);
			versionLabel.frame = CGRectMoveX(width - vWidth - 22, versionLabel.frame);
			developerLabel.frame = CGRectMoveX(width - dWidth - 22, developerLabel.frame);
		}
	} completion:nil];

	[packageNameLabel setTextAlignment:alignment];
	[versionLabel setTextAlignment:alignment];
	[developerLabel setTextAlignment:alignment];
}

-(void)preferencesChanged {
	static NSInteger aprilAlignment;
	static NSInteger aprilSpringAnimationVelocity;
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
	[prefs registerInteger:&aprilAlignment default:0 forKey:@"aprilAlignment"];
	[prefs registerInteger:&aprilSpringAnimationVelocity default:5 forKey:@"aprilSpringAnimationVelocity"];
	[self setAlignment:(int)aprilAlignment velocity:(int)aprilSpringAnimationVelocity];
}

-(instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Amelia" specifier:specifier];
}

-(void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
	return 215.0f;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	int width = self.contentView.bounds.size.width;
	CGRect frame = CGRectMake(0, 0, width, 215);

	bgView = [[UIView alloc] initWithFrame:frame];

	UIColor *topColor = APRColorMain;
	UIColor *bottomColor = [UIColor colorWithRed:1 green:185/255.f blue:0 alpha:0.85];

	CAGradientLayer *vg = [CAGradientLayer layer];
	vg.colors = [NSArray arrayWithObjects: (id)topColor.CGColor, (id)bottomColor.CGColor, nil];
	vg.startPoint = CGPointMake(0.0, 0.0);
	vg.endPoint = CGPointMake(1.0, 1.0);
	vg.frame = bgView.bounds;

	// Add gradient to view
	[bgView.layer insertSublayer:vg atIndex:0];
	[self insertSubview:bgView atIndex:0];
}

-(CGFloat)preferredHeightForWidth:(CGFloat)width inTableView:(id)tableView {
	return [self preferredHeightForWidth:width];
}
@end