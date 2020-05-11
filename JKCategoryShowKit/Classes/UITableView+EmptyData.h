//
//  UITableView+EmptyData.h
//  ttkhj-ios
//
//  Created by ning on 16/12/13.
//  Copyright © 2016年 abcd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)
- (void)tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;

-(void)tableViewDisplayWithImage:(NSString *)name ifNecessaryForRowCount:(NSUInteger)rowCount;
@end
