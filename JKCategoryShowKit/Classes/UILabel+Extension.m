//
//  UILabel+Extension.m
//  TTYingShi
//
//  Created by ning on 2017/3/2.
//  Copyright © 2017年 abcd. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
+(instancetype)lableWithFrame:(CGRect)rect font:(UIFont *)font textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment backgoundColor:(UIColor *)backgroundColor{
    UILabel *Labe = [[UILabel alloc] initWithFrame:rect];
    Labe.backgroundColor = backgroundColor == nil ? [UIColor whiteColor] : backgroundColor;
    Labe.textColor = textColor;
    Labe.textAlignment = alignment;
    Labe.font = font;
    return Labe;
}
@end
