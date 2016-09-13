//
//	ReaderThumbFetch.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ReaderThumbQueue.h"

@class ReaderThumbRequest;

@interface ReaderThumbFetch : ReaderThumbOperation

- (instancetype)initWithRequest:(ReaderThumbRequest *)options;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com