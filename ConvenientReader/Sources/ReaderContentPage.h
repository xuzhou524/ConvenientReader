//
//	ReaderContentPage.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReaderContentPage : UIView

- (instancetype)initWithURL:(NSURL *)fileURL page:(NSInteger)page password:(NSString *)phrase;

- (id)processSingleTap:(UITapGestureRecognizer *)recognizer;

@end

#pragma mark -

//
//	ReaderDocumentLink class interface
//

@interface ReaderDocumentLink : NSObject <NSObject>

@property (nonatomic, assign, readonly) CGRect rect;

@property (nonatomic, assign, readonly) CGPDFDictionaryRef dictionary;

+ (instancetype)newWithRect:(CGRect)linkRect dictionary:(CGPDFDictionaryRef)linkDictionary;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com