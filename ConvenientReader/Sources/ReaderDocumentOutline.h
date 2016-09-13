//
//	ReaderDocumentOutline.m
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReaderDocumentOutline : NSObject <NSObject>

+ (NSArray *)outlineFromFileURL:(NSURL *)fileURL password:(NSString *)phrase;

+ (void)logDocumentOutlineArray:(NSArray *)array;

@end

@interface DocumentOutlineEntry : NSObject <NSObject>

+ (instancetype)newWithTitle:(NSString *)title target:(id)target level:(NSInteger)level;

@property (nonatomic, assign, readonly) NSInteger level;
@property (nonatomic, strong, readwrite) NSMutableArray *children;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) id target;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com