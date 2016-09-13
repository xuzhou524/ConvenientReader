//
//	CGPDFDocument.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

//
//	Custom CGPDFDocument[...] functions
//

CGPDFDocumentRef CGPDFDocumentCreateUsingUrl(CFURLRef theURL, NSString *password);

CGPDFDocumentRef CGPDFDocumentCreateUsingData(CGDataProviderRef dataProvider, NSString *password);

BOOL CGPDFDocumentUrlNeedsPassword(CFURLRef theURL, NSString *password);

BOOL CGPDFDocumentDataNeedsPassword(CGDataProviderRef dataProvider, NSString *password);
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com