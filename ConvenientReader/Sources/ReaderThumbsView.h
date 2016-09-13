//
//	ReaderThumbsView.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ReaderThumbView.h"

@class ReaderThumbsView;

@protocol ReaderThumbsViewDelegate <NSObject, UIScrollViewDelegate>

@required // Delegate protocols

- (NSUInteger)numberOfThumbsInThumbsView:(ReaderThumbsView *)thumbsView;

- (id)thumbsView:(ReaderThumbsView *)thumbsView thumbCellWithFrame:(CGRect)frame;

- (void)thumbsView:(ReaderThumbsView *)thumbsView updateThumbCell:(id)thumbCell forIndex:(NSInteger)index;

- (void)thumbsView:(ReaderThumbsView *)thumbsView didSelectThumbWithIndex:(NSInteger)index;

@optional // Delegate protocols

- (void)thumbsView:(ReaderThumbsView *)thumbsView refreshThumbCell:(id)thumbCell forIndex:(NSInteger)index;

- (void)thumbsView:(ReaderThumbsView *)thumbsView didPressThumbWithIndex:(NSInteger)index;

@end

@interface ReaderThumbsView : UIScrollView

@property (nonatomic, weak, readwrite) id <ReaderThumbsViewDelegate> delegate;

- (void)setThumbSize:(CGSize)thumbSize;

- (void)reloadThumbsCenterOnIndex:(NSInteger)index;

- (void)reloadThumbsContentOffset:(CGPoint)newContentOffset;

- (void)refreshThumbWithIndex:(NSInteger)index;

- (void)refreshVisibleThumbs;

- (CGPoint)insetContentOffset;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com