//
//	ThumbsMainToolbar.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIXToolbarView.h"

@class ThumbsMainToolbar;

@protocol ThumbsMainToolbarDelegate <NSObject>

@required // Delegate protocols

- (void)tappedInToolbar:(ThumbsMainToolbar *)toolbar doneButton:(UIButton *)button;
- (void)tappedInToolbar:(ThumbsMainToolbar *)toolbar showControl:(UISegmentedControl *)control;

@end

@interface ThumbsMainToolbar : UIXToolbarView

@property (nonatomic, weak, readwrite) id <ThumbsMainToolbarDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com