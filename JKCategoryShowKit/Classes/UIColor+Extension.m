//
//  UIColor+Extension.m
//  BasicFramework
//
//  Created by Rainy on 2017/1/17.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#import "UIColor+Extension.h"
#import "UIColor+CustomColors.h"
@implementation UIColor (Extension)
+ (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
}

+ (UIColor *)colorWithLevel:(NSInteger)level{
    
    switch (level) {
        case 1:
            return [UIColor colorWithHexString:@"FFFFFF" Alpha:1];
        case 2:
            return [UIColor colorWithHexString:@"45e4fc" Alpha:1];
            break;
        case 3:
            return [UIColor colorWithHexString:@"5995f9" Alpha:1];
            break;
        case 4:
            return [UIColor colorWithHexString:@"fbd70f" Alpha:1];
            break;
        case 5:
            return [UIColor colorWithHexString:@"fb9f0f" Alpha:1];
            break;
        case 6:
            return [UIColor colorWithHexString:@"fa3b44" Alpha:1];
            break;
        case 7:
            return [UIColor colorWithHexString:@"f35bf5" Alpha:1];
            break;
        case 8:
            return [UIColor colorWithHexString:@"c478ff" Alpha:1];
            break;
        case 9:
            return [UIColor colorWithHexString:@"ff755e" Alpha:1];
            break;
        case 10:
            return [UIColor colorWithHexString:@"a8e74d" Alpha:1];
            break;
        default:
           return [UIColor randomColor];
    }
}
@end
