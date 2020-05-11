//
//  UITableView+EmptyData.m
//  ttkhj-ios
//
//  Created by ning on 16/12/13.
//  Copyright © 2016年 abcd. All rights reserved.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        // Display a message when the table is empty
        // 没有数据的时候，UILabel的显示样式
        UILabel *messageLabel = [[UILabel alloc]init];
        
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        
        self.backgroundView = messageLabel;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    } else {
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
}

-(void)tableViewDisplayWithImage:(NSString *)name ifNecessaryForRowCount:(NSUInteger)rowCount{
    if (rowCount==0) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:name];
        [imageView sizeToFit];
        self.backgroundView = imageView;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else{
        self.backgroundView = nil;
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    
}
@end
