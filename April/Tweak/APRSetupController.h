#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>

@interface APRSetupController : UIViewController
@property (nonatomic, assign) BOOL useFTWeather;
@property (nonatomic, assign) BOOL useFTTime;
@property (nonatomic, assign) BOOL useFTDate;
-(void)setWeather;
-(void)setTime;
-(void)setDate;
@end