// Imports
#import <Cephei/HBPreferences.h>
#import <CoreText/CoreText.h>
#import <EventKit/EventKit.h>
#import <PeterDev/libpddokdo.h>
#define LD_DEBUG NO
#import "APRSetupController.h"
#import "Extensions/UIView+ParentVC.h"
#import "Extensions/NSString+HexString.h"

#ifdef __cplusplus /* If this is a C++ compiler, use C linkage */
extern "C" {
#endif
UIColor *LCPParseColorString(NSString *colorStringFromPrefs, NSString *colorStringFallback);
//old DONT USE
UIColor *colorFromDefaultsWithKey(NSString *defaults, NSString *key, NSString *fallback);

#ifdef __cplusplus /* If this is a C++ compiler, end C linkage */
}
#endif

extern CFArrayRef CPBitmapCreateImagesFromData(CFDataRef cpbitmap, void*, int, void*);

// Preference Variables
static NSInteger aprilAlignment;
static NSInteger aprilSpringAnimationVelocity;
static NSInteger aprilOffset;
static BOOL aprilChargingInformation;
static BOOL aprilPreserveKalm;
static BOOL aprilAlwaysUseWallpaper;

// Time
static BOOL aprilTimeLabelSwitch;
static BOOL aprilTimeLabelLowercase;
static NSString *aprilTimeLabelColor;
static NSInteger aprilTimeLabelSize;
static CGFloat aprilTimeLabelWeight;
static NSString *aprilTimeLabelFormat;
static NSString *aprilTimeFontName;
static NSString *aprilTimeZone;

// Date
static BOOL aprilDateLabelSwitch;
static BOOL aprilDateBatteryOnly;
static BOOL aprilDateLabelLowercase;
static NSString *aprilDateLabelColor;
static NSInteger aprilDateLabelSize;
static CGFloat aprilDateLabelWeight;
static NSString *aprilDateLabelFormat;
static NSString *aprilDateLabelCalendar;

// Weather
static BOOL aprilWeatherLabelSwitch;
static BOOL aprilWeatherLabelLowercase;
static NSString *aprilWeatherLabelColor;
static NSInteger aprilWeatherLabelSize;
static CGFloat aprilWeatherLabelWeight;
static BOOL aprilWeatherUseConditionImages;
static NSInteger aprilWeatherConditionImageAlignment;
static NSInteger aprilWeatherUpdateTime;
static NSString *aprilWeatherLabelFormat;
static NSString *aprilSolarTimeFormat;

// Up Next
static BOOL aprilEventLabelSwitch;
static NSString *aprilEventTitleColor;
static NSInteger aprilEventTitleSize;
static CGFloat aprilEventTitleWeight;
static NSString *aprilEventDetailColor;
static NSInteger aprilEventDetailSize;
static CGFloat aprilEventDetailWeight;
static NSString *aprilEventDetailFormat;
static NSString *aprilEventCalendarTitle;

// FaceID
static BOOL aprilHideFaceIDLock;
static CGFloat aprilFaceIDXControl;
static CGFloat aprilFaceIDYControl;
static CGFloat aprilFaceIDSizeControl;
static CGFloat aprilFaceIDAlphaControl;
static NSString *aprilFaceIDLockColor;

// Global
static BOOL aprilBatteryWhenCharging;
static NSInteger aprilPreferredLanguage;

// Music
static BOOL aprilHideWhenPlaying;

// Variable Interfaces
@interface SBFLockScreenDateSubtitleView : UIView
@end

@interface SBFLockScreenDateView : UIView
@property (assign,getter=isSubtitleHidden,nonatomic) BOOL subtitleHidden;
@property (nonatomic, readonly) long long _keyboardOrientation;
@property (nonatomic, retain) NSDate *date;
-(void)setCustomSubtitleView:(SBFLockScreenDateSubtitleView *)arg1;
-(id)_timeLabel;

// April
@property (retain) UIStackView *aprilStackView;
@property (retain) UIStackView *weatherStackView;
@property (retain) UIImageView *weatherConditionImage;
@property (retain) UIView      *fillerView;
@property (retain) UILabel     *timeLabel;
@property (retain) UILabel     *dateLabel;
@property (retain) UILabel     *weatherLabel;
@property (retain) UIStackView *eventStackView;
@property (retain) UILabel     *eventTitle;
@property (retain) UILabel     *eventDetails;
-(void)setupApril;
-(void)updateEventsLabel;
-(void)updateClockAndDateLabel;
-(void)updateWeatherLabel;
-(void)updateWeatherForCity;
-(void)batteryStateChanged:(NSNotification *)notification;
-(void)alignmentWithGesture:(UITapGestureRecognizer *)gesture;
-(void)setAlignment:(int)alignment;
-(void)switchViewPositions:(UITapGestureRecognizer *)gesture;
-(void)fadeOutAprilWithDuration:(float)duration withDelay:(float)delay;
-(void)fadeInAprilWithDuration:(float)duration withDelay:(float)delay;
-(void)fadeOutOthersWithDuration:(float)duration withDelay:(float)delay;
-(void)fadeInOthersWithDuration:(float)duration withDelay:(float)delay;
-(void)spacingWithOffset:(UIScrollView*)offset;
-(void)preferencesChanged;
@end

// Variables
static SBFLockScreenDateView *lockScreenDateView;
static UITapGestureRecognizer *lockScreenDateViewGesture;
static UIColor *lockColor;
static CGRect lsFrame;
static UIView *touchView;
static BOOL addedView;
static BOOL shouldRealignViews;

// Function Interfaces
@interface MPArtworkColorAnalyzer : NSObject
@property (nonatomic,readonly) long long algorithm;
@property (nonatomic,readonly) UIImage *image;
-(id)initWithImage:(id)arg1 algorithm:(long long)arg2;
-(void)analyzeWithCompletionHandler:(/*^block*/id)arg1;
-(id)_fallbackColorAnalysis;
@end

@interface MPArtworkColorAnalysis
@property (nonatomic,readonly) UIColor *backgroundColor;
@property (getter=isBackgroundColorLight,nonatomic,readonly) BOOL backgroundColorLight;
@property (nonatomic,readonly) UIColor *primaryTextColor;
@property (getter=isPrimaryTextColorLight,nonatomic,readonly) BOOL primaryTextColorLight;
@property (nonatomic,readonly) UIColor *secondaryTextColor;
@property (getter=isSecondaryTextColorLight,nonatomic,readonly) BOOL secondaryTextColorLight;
-(UIColor*)backgroundColor;
-(BOOL)isBackgroundColorLight;
-(UIColor*)primaryTextColor;
-(BOOL)isPrimaryTextColorLight;
-(UIColor*)secondaryTextColor;
-(BOOL)isSecondaryTextColorLight;
@end

static void aprilUseWallpaperColors() {
  NSData *lockData = [NSData dataWithContentsOfFile:@"/User/Library/SpringBoard/OriginalLockBackground.cpbitmap"];
  CFArrayRef lockArrayRef = CPBitmapCreateImagesFromData((__bridge CFDataRef)lockData, NULL, 1, NULL);
  NSArray *lockArray = (__bridge NSArray*)lockArrayRef;
  UIImage *lockWallpaper = [[UIImage alloc] initWithCGImage:(__bridge CGImageRef)(lockArray[0])];
  CFRelease(lockArrayRef);
  MPArtworkColorAnalyzer *mca = [[MPArtworkColorAnalyzer alloc] initWithImage:lockWallpaper algorithm:0];
	[mca analyzeWithCompletionHandler:^(MPArtworkColorAnalyzer *mcd, MPArtworkColorAnalysis *mcx) {
		NSString *weatherHex = [NSString hexStringForColor:mcx.secondaryTextColor];
    NSString *timeHex    = [NSString hexStringForColor:mcx.primaryTextColor];
    NSString *dateHex    = [NSString hexStringForColor:mcx.primaryTextColor];
    NSString *eventHex   = [NSString hexStringForColor:mcx.secondaryTextColor];
    NSString *detailHex  = [NSString hexStringForColor:mcx.secondaryTextColor];
    NSString *lockHex    = [NSString hexStringForColor:mcx.primaryTextColor];
    HBPreferences *prefs = [HBPreferences preferencesForIdentifier:@"com.constanze.aprilprefs"];
    [prefs setObject:timeHex    forKey:@"aprilTimeLabelColor"];
    [prefs setObject:dateHex    forKey:@"aprilDateLabelColor"];
    [prefs setObject:weatherHex forKey:@"aprilWeatherLabelColor"];
    [prefs setObject:eventHex   forKey:@"aprilEventTitleColor"];
    [prefs setObject:detailHex  forKey:@"aprilEventDetailColor"];
    [prefs setObject:lockHex    forKey:@"aprilFaceIDLockColor"];
    [lockScreenDateView preferencesChanged];
	}];
}

void loadPrefs() {
  HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
  [prefs registerInteger:&aprilAlignment default:0 forKey:@"aprilAlignment"];
  [prefs registerInteger:&aprilSpringAnimationVelocity default:5.0 forKey:@"aprilSpringAnimationVelocity"];
  [prefs registerInteger:&aprilOffset default:0 forKey:@"aprilOffset"];
  [prefs registerBool:&aprilPreserveKalm default:NO forKey:@"aprilPreserveKalm"];
  [prefs registerBool:&aprilAlwaysUseWallpaper default:YES forKey:@"aprilAlwaysUseWallpaper"];
  aprilChargingInformation = YES;

  [prefs registerBool:&aprilTimeLabelSwitch default:YES forKey:@"aprilTimeLabelSwitch"];
  [prefs registerBool:&aprilTimeLabelLowercase default:NO forKey:@"aprilTimeLabelLowercase"];
  [prefs registerObject:&aprilTimeLabelColor default:@"#FFFFFF" forKey:@"aprilTimeLabelColor"];
  [prefs registerInteger:&aprilTimeLabelSize default:55 forKey:@"aprilTimeLabelSize"];
  [prefs registerFloat:&aprilTimeLabelWeight default:UIFontWeightSemibold forKey:@"aprilTimeLabelWeight"];
  [prefs registerObject:&aprilTimeLabelFormat default:@"h:mm" forKey:@"aprilTimeLabelFormat"];
  [prefs registerObject:&aprilTimeFontName default:@"Avenir Next" forKey:@"aprilTimeFontName"];
  [prefs registerObject:&aprilTimeZone default:@"" forKey:@"aprilTimeZone"];

  [prefs registerBool:&aprilDateLabelSwitch default:YES forKey:@"aprilDateLabelSwitch"];
  [prefs registerBool:&aprilDateBatteryOnly default:NO forKey:@"aprilDateBatteryOnly"];
  [prefs registerBool:&aprilDateLabelLowercase default:NO forKey:@"aprilDateLabelLowercase"];
  [prefs registerObject:&aprilDateLabelColor default:@"#FFFFFF" forKey:@"aprilDateLabelColor"];
  [prefs registerInteger:&aprilDateLabelSize default:24 forKey:@"aprilDateLabelSize"];
  [prefs registerFloat:&aprilDateLabelWeight default:UIFontWeightLight forKey:@"aprilDateLabelWeight"];
  [prefs registerObject:&aprilDateLabelFormat default:@"EEEE, MMMM d" forKey:@"aprilDateLabelFormat"];
  [prefs registerObject:&aprilDateLabelCalendar default:@"gregorian" forKey:@"aprilDateLabelCalendar"];

  [prefs registerBool:&aprilWeatherLabelSwitch default:YES forKey:@"aprilWeatherLabelSwitch"];
  [prefs registerBool:&aprilWeatherLabelLowercase default:NO forKey:@"aprilWeatherLabelLowercase"];
  [prefs registerObject:&aprilWeatherLabelColor default:@"#FFFFFF" forKey:@"aprilWeatherLabelColor"];
  [prefs registerInteger:&aprilWeatherLabelSize default:20 forKey:@"aprilWeatherLabelSize"];
  [prefs registerFloat:&aprilWeatherLabelWeight default:UIFontWeightLight forKey:@"aprilWeatherLabelWeight"];
  [prefs registerObject:&aprilWeatherLabelFormat default:@"DG CND" forKey:@"aprilWeatherLabelFormat"];
  [prefs registerBool:&aprilWeatherUseConditionImages default:YES forKey:@"aprilWeatherUseConditionImages"];
  [prefs registerInteger:&aprilWeatherConditionImageAlignment default:0 forKey:@"aprilWeatherConditionImageAlignment"];
  [prefs registerInteger:&aprilWeatherUpdateTime default:0 forKey:@"aprilWeatherUpdateTime"];
  [prefs registerObject:&aprilSolarTimeFormat default:@"H:mm" forKey:@"aprilSolarTimeFormat"];

  [prefs registerBool:&aprilEventLabelSwitch default:YES forKey:@"aprilEventLabelSwitch"];
  [prefs registerObject:&aprilEventTitleColor default:@"#FFFFFF" forKey:@"aprilEventTitleColor"];
  [prefs registerInteger:&aprilEventTitleSize default:20 forKey:@"aprilEventTitleSize"];
  [prefs registerFloat:&aprilEventTitleWeight default:UIFontWeightSemibold forKey:@"aprilEventTitleWeight"];

  [prefs registerObject:&aprilEventDetailColor default:@"#FFFFFF" forKey:@"aprilEventDetailColor"];
  [prefs registerInteger:&aprilEventDetailSize default:15 forKey:@"aprilEventDetailSize"];
  [prefs registerFloat:&aprilEventDetailWeight default:UIFontWeightMedium forKey:@"aprilEventDetailWeight"];
  [prefs registerObject:&aprilEventDetailFormat default:@"EEEE, MMMM d h:mm" forKey:@"aprilEventDetailFormat"];
  [prefs registerObject:&aprilEventCalendarTitle default:@"Work" forKey:@"aprilEventCalendarTitle"];

  [prefs registerBool:&aprilHideFaceIDLock default:NO forKey:@"aprilHideFaceIDLock"];
  [prefs registerObject:&aprilFaceIDLockColor default:@"#FFFFFF" forKey:@"aprilFaceIDLockColor"];
  [prefs registerFloat:&aprilFaceIDXControl default:176.f forKey:@"aprilFaceIDXControl"];
  [prefs registerFloat:&aprilFaceIDYControl default:0.f forKey:@"aprilFaceIDYControl"];
  [prefs registerFloat:&aprilFaceIDSizeControl default:0.f forKey:@"aprilFaceIDSizeControl"];
  [prefs registerFloat:&aprilFaceIDAlphaControl default:1.f forKey:@"aprilFaceIDAlphaControl"];

  [prefs registerBool:&aprilHideWhenPlaying default:YES forKey:@"aprilHideWhenPlaying"];

  [prefs registerBool:&aprilBatteryWhenCharging default:NO forKey:@"aprilBatteryWhenCharging"];
  [prefs registerInteger:&aprilPreferredLanguage default:0 forKey:@"aprilPreferredLanguage"];

  [prefs registerPreferenceChangeBlock:^ {
    [lockScreenDateView preferencesChanged];
  }];
}

@interface CSScrollView : UIScrollView
@end

@interface SBIconController : UIViewController
@end

@interface CSMainPageView : UIView
@end

@interface SBDashBoardMainPageView : UIView
@end

@interface SBUILegibilityLabel : UIView
@end

@interface CSCoverSheetViewBase : UIView
@end

@interface SBDashBoardViewBase : UIView
@end

@interface SBDashBoardViewController : UIViewController
@end

@interface CSCoverSheetViewController : UIViewController
@end

@interface SBPagedScrollView : UIScrollView
@property (assign, nonatomic) unsigned long long currentPageIndex;
@property (nonatomic, readonly) long long _keyboardOrientation;
@end

@interface SBFPagedScrollView : UIScrollView
@property (assign, nonatomic) unsigned long long currentPageIndex;
@property (nonatomic, readonly) long long _keyboardOrientation;
@end

@interface SBUIProudLockIconView : UIView
-(id)initWithFrame:(CGRect)arg1;
-(void)didMoveToWindow;
-(void)setContentColor:(UIColor*)arg1;
@end

@interface UIColor (PFColor)
+ (UIColor *)PF_colorWithHex:(NSString *)hexString;
+ (NSString *)hexFromColor:(UIColor *)color;
@property (nonatomic, assign, readonly) CGFloat alpha;
@property (nonatomic, assign, readonly) CGFloat red;
@property (nonatomic, assign, readonly) CGFloat green;
@property (nonatomic, assign, readonly) CGFloat blue;
@property (nonatomic, assign, readonly) CGFloat hue;
@property (nonatomic, assign, readonly) CGFloat saturation;
@property (nonatomic, assign, readonly) CGFloat brightness;
- (UIColor *)desaturate:(CGFloat)percent;
- (UIColor *)lighten:(CGFloat)percent;
- (UIColor *)darken:(CGFloat)percent;
@end

@interface PFColorAlert : NSObject
// DO NOT USE OLD METHOD
//- (void)showWithStartColor:(UIColor *)startColor showAlpha:(BOOL)showAlpha completion:(void (^)(UIColor *pickedColor))completionBlock;
+ (PFColorAlert *)colorAlertWithStartColor:(UIColor *)startColor showAlpha:(BOOL)showAlpha;
- (PFColorAlert *)initWithStartColor:(UIColor *)startColor showAlpha:(BOOL)showAlpha;
- (void)displayWithCompletion:(void (^)(UIColor *pickedColor))fcompletionBlock;
- (void)close;
@end

@interface PFLiteColorCell : UITableViewCell
- (id)initWithStyle:(long long)style reuseIdentifier:(id)identifier specifier:(id)specifier;
- (UIColor *)previewColor; // this will be used for the circle preview view. override in a subclass
- (id)specifier;
- (void)updateCellDisplay;
@end

@interface PFSimpleLiteColorCell : PFLiteColorCell
@end

// Redefine Vars from interfaces
static SBPagedScrollView *pagedScrollView;
static SBUIProudLockIconView *proudLockIconView;

// Force allow content hugging priority
@interface UILabel (April)
-(void)setContentHuggingPriority:(float)arg1 forAxis:(NSInteger)arg2;
@end

@interface UIImageView (April)
-(void)setContentHuggingPriority:(float)arg1 forAxis:(NSInteger)arg2;
@end