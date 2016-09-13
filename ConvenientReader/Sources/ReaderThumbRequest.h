//
//	ReaderThumbRequest.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReaderThumbView;

@interface ReaderThumbRequest : NSObject <NSObject>

@property (nonatomic, strong, readonly) NSURL *fileURL;
@property (nonatomic, strong, readonly) NSString *guid;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *cacheKey;
@property (nonatomic, strong, readonly) NSString *thumbName;
@property (nonatomic, strong, readwrite) ReaderThumbView *thumbView;
@property (nonatomic, assign, readonly) NSUInteger targetTag;
@property (nonatomic, assign, readonly) NSInteger thumbPage;
@property (nonatomic, assign, readonly) CGSize thumbSize;
@property (nonatomic, assign, readonly) CGFloat scale;

+ (instancetype)newForView:(ReaderThumbView *)view fileURL:(NSURL *)url password:(NSString *)phrase guid:(NSString *)guid page:(NSInteger)page size:(CGSize)size;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com