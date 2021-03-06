//
//  UIBarButtonItem+Extension.m
//  BasicFramework
//
//  Created by Rainy on 16/10/26.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"
@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.adjustsImageWhenHighlighted = NO;
    
    button.TT_size= button.currentBackgroundImage.size;
    if (button.currentBackgroundImage.size.width < 24) {
        button.TT_size= CGSizeMake(24, 24);
    }
    
    
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
