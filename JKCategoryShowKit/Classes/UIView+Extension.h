
#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property(nonatomic)CGFloat cornerRad;
@property(nonatomic)CGFloat TT_Cy;
@property(nonatomic)CGFloat TT_Cx;

@property(nonatomic,assign)CGFloat TT_X;
@property(nonatomic,assign)CGFloat TT_Y;
@property(nonatomic,assign)CGFloat TT_Sh;
@property (nonatomic,assign)CGSize TT_size;
@property(nonatomic,assign)CGFloat TT_Sw;

-(void)setBlurStyle:(UIBlurEffectStyle)style;

#pragma mark - Create Table for button
+(UIView *)CreateTableWithFrame:(CGRect )frame Number:(int)Number spacing:(CGFloat)spacing;

#pragma mark - TapAction LongPressAction
- (void)setTapActionWithBlock:(void (^)(void))block;
- (void)setLongPressActionWithBlock:(void (^)(void))block;

/**
 *  添加圆角边框
 */
-(void)addBorderWithcornerRad:(CGFloat)cornerRad lineCollor:(UIColor *)collor lineWidth:(CGFloat)lineWidth;
/**
 *  加载
 */
-(void)startLoading;
-(void)stopLoding;

@end
