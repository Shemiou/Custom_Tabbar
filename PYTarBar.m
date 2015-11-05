//
//  PYTarBar.m
//  0916TabBarViewController
//
//  Created by qianfeng on 15/9/16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PYTarBar.h"
#import "PY_Header.h"
#define btnTag 99

@interface PYTarBar()

@property(nonatomic,weak)UIImageView *background;

@end

@implementation PYTarBar

+ (id)tabBar{
    
    return  [[self alloc] init];
}

//懒加载
- (UIImageView *)background{
    
    if (!_background) {
        
        //设置背景图片
        UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"panelbottompart1"]];
        
        background.frame = CGRectMake(0, 0, Screen_width, 60);
        
        //一定要打开交互性，否则无法实现点击
        background.userInteractionEnabled = YES;
        
        //建立父子关系
        [self addSubview:background];
        //赋值
        _background = background;
    }
    return _background;
}

- (void)setItems:(NSArray *)items{
    
    //保存成员变量
    _items = items;
    CGFloat aveWidth = (Screen_width - 10) / items.count;
    //添加子控件
    for (int i = 0; i < items.count; i ++) {
        UIButton *btn = items[i];
        
        [self.background addSubview:btn];
        btn.tag = btnTag + i;
        //设置frame，必须先给确定的大小
        btn.frame = CGRectMake( i*aveWidth, 0, aveWidth, 60);
        
        //添加响应事件
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
       
    }
    
    //默认选中第一个选项
    [self btnAction:items[0]];
}

//监听事件
- (void)btnAction:(UIButton *)btn{
    
    if (btn.selected) {
        return;
    }
    //先清空就可以每次只选中一个
    for (UIButton *tempBtn in self.items) {
        tempBtn.selected = NO;
    }
    btn.selected = YES;
    //通过tag值的临时标记来使用
    NSInteger Index = btn.tag - btnTag;
    
#pragma mark ======== 在这里修改selected的状态
    
    if (self.tabbarItemSelected) {
        
        self.tabbarItemSelected(Index);
    }
    
}

#pragma mark ============= 系统提供的方法，当视图即将被安装到某一个视图； 并且会把目标视图指针地址传递进来
- (void)willMoveToSuperview:(UIView *)newSuperview{

    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, newSuperview.frame.size.height - 60, newSuperview.frame.size.width, 60);

}

@end























