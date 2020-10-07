@interface UIDevice (notchedDevice)
@property (nonatomic,readonly) NSString * model;
-(NSString *)model;
-(BOOL)isNotched;
-(BOOL)isAnIpad;
-(BOOL)isAnIpod;
@end
