//
//	ThumbsViewController.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ThumbsMainToolbar.h"
#import "ReaderThumbsView.h"

@class ReaderDocument;
@class ThumbsViewController;

@protocol ThumbsViewControllerDelegate <NSObject>

@required // Delegate protocols

- (void)thumbsViewController:(ThumbsViewController *)viewController gotoPage:(NSInteger)page;

- (void)dismissThumbsViewController:(ThumbsViewController *)viewController;

@end

@interface ThumbsViewController : UIViewController

@property (nonatomic, weak, readwrite) id <ThumbsViewControllerDelegate> delegate;

- (instancetype)initWithReaderDocument:(ReaderDocument *)object;

@end

#pragma mark -

//
//	ThumbsPageThumb class interface
//

@interface ThumbsPageThumb : ReaderThumbView

- (CGSize)maximumContentSize;

- (void)showText:(NSString *)text;

- (void)showBookmark:(BOOL)show;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com