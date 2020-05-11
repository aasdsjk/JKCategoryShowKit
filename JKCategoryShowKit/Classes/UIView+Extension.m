

#import "UIView+Extension.h"
#import <objc/runtime.h>

static char kDTActionHandlerTapBlockKey;
static char kDTActionHandlerTapGestureKey;
static char kDTActionHandlerLongPressBlockKey;
static char kDTActionHandlerLongPressGestureKey;

@interface UIView ()

@property(nonatomic,strong)UIActivityIndicatorView *activity;

@end

@implementation UIView (Extension)

-(void)startLoading
{
    if (!self.activity) {
        
        UIActivityIndicatorView *temp_activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        temp_activity.frame = CGRectMake(0, 0, 20, 20);
        temp_activity.center = CGPointMake(self.TT_Sw/2, self.TT_Sh/2);
        
        [temp_activity startAnimating];
        self.activity = temp_activity;
        [self addSubview:self.activity];
    }
}
-(void)stopLoding
{
    [self.activity stopAnimating];
    [self.activity removeFromSuperview];
    self.activity = nil;
}
// 在分类里添加属性
static char AddressKey;
-(void)setActivity:(UIActivityIndicatorView *)activity
{
    objc_setAssociatedObject(self, &AddressKey, activity, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIActivityIndicatorView *)activity
{
    return objc_getAssociatedObject(self, &AddressKey);
}


-(void)addBorderWithcornerRad:(CGFloat)cornerRad lineCollor:(UIColor *)collor lineWidth:(CGFloat)lineWidth
{
    self.layer.borderWidth = lineWidth;
    self.cornerRad = cornerRad;
    self.layer.borderColor = collor.CGColor;
    
}

- (void)setTapActionWithBlock:(void (^)(void))block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

- (void)setLongPressActionWithBlock:(void (^)(void))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerLongPressGestureKey);
    
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kDTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerLongPressBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

-(void)setCornerRad:(CGFloat)cornerRad
{
    self.layer.cornerRadius = cornerRad;
    self.layer.masksToBounds = YES;
    
}
-(CGFloat)cornerRad
{
    return self.cornerRad;
}
-(void)setTT_Cy:(CGFloat)TT_Cy
{
    CGPoint center = self.center;
    center.y = TT_Cy;
    self.center = center;
}
-(CGFloat)TT_Cy
{
    return self.center.y;
}
-(void)setTT_Cx:(CGFloat)TT_Cx
{
    CGPoint center = self.center;
    center.x = TT_Cx;
    self.center = center;
}
-(CGFloat)TT_Cx
{
    return self.center.x;
}
-(void)setTT_Sh:(CGFloat)TT_Sh
{
    CGRect fram = self.frame;
    fram.size.height = TT_Sh;
    self.frame = fram;
}
-(CGFloat)TT_Sh
{
    return self.frame.size.height;
}
-(void)setTT_Sw:(CGFloat)TT_Sw
{
    CGRect fram = self.frame;
    fram.size.width = TT_Sw;
    self.frame = fram;
}
-(CGFloat)TT_Sw
{
    return self.frame.size.width;
}

-(CGFloat)TT_X
{
    return self.frame.origin.x;
}
-(CGFloat)TT_Y
{
    return self.frame.origin.y;
}
-(void)setTT_X:(CGFloat)TT_X
{
    CGRect frame = self.frame;
    frame.origin.x = TT_X;
    self.frame = frame;
}
-(void)setTT_Y:(CGFloat)TT_Y
{
    CGRect frame = self.frame;
    frame.origin.y = TT_Y;
    self.frame = frame;
}
- (void)setTT_size:(CGSize)TT_size
{
    CGRect frame = self.frame;
    frame.size = TT_size;
    self.frame = frame;
}

- (CGSize)TT_size
{
    return self.frame.size;
}

-(void)setBlurStyle:(UIBlurEffectStyle)style
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.bounds;
    [self addSubview:effectView];
}
+(UIView *)CreateTableWithFrame:(CGRect )frame Number:(int)Number spacing:(CGFloat)spacing
{
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    
    
    CGRect rect = CGRectMake(0, 0, view.TT_Sw/Number - spacing, view.TT_Sh/Number - spacing);
    
    
    
    for (int i = 1 ; i <= Number; i++ ) {
        for (int j = 1; j <= Number; j++) {
            UIButton *button = [[UIButton alloc]initWithFrame:rect];
            [view addSubview:button];
            [button setBackgroundColor:[UIColor brownColor]];
            rect = CGRectOffset(rect, view.TT_Sw/Number , 0);
            if (j == Number) {
                
                button.TT_Sw += view.TT_Sw - CGRectGetMaxX(button.frame);
            }
            
            if (i == Number) {
                
                button.TT_Sh += view.TT_Sh - CGRectGetMaxY(button.frame);
            }
        }
        
        rect.origin.x = 0;
        rect.origin.y = rect.origin.y + view.TT_Sh/Number;
        
        
    }

    
    return view;
}


@end
