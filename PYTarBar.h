//
//  PYTarBar.h
//  0916TabBarViewController
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark ******************* 记住要问


@interface PYTarBar : UIView
//数组中
@property(nonatomic,retain)NSArray *items;
+ (id)tabBar;

//block方法
@property(nonatomic,copy)void (^tabbarItemSelected)(NSInteger index);

@end
