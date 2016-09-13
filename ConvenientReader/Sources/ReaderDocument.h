//
//	ReaderDocument.h
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReaderDocument : NSObject <NSObject, NSCoding>

@property (nonatomic, strong, readonly) NSString *guid;
@property (nonatomic, strong, readonly) NSDate *fileDate;
@property (nonatomic, strong, readwrite) NSDate *lastOpen;
@property (nonatomic, strong, readonly) NSNumber *fileSize;
@property (nonatomic, strong, readonly) NSNumber *pageCount;
@property (nonatomic, strong, readwrite) NSNumber *pageNumber;
@property (nonatomic, strong, readonly) NSMutableIndexSet *bookmarks;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *fileName;
@property (nonatomic, strong, readonly) NSURL *fileURL;

@property (nonatomic, readonly) BOOL canEmail;
@property (nonatomic, readonly) BOOL canExport;
@property (nonatomic, readonly) BOOL canPrint;

+ (ReaderDocument *)withDocumentFilePath:(NSString *)filePath password:(NSString *)phrase;

+ (ReaderDocument *)unarchiveFromFileName:(NSString *)filePath password:(NSString *)phrase;

- (instancetype)initWithFilePath:(NSString *)filePath password:(NSString *)phrase;

- (BOOL)archiveDocumentProperties;

- (void)updateDocumentProperties;

/**
  保存PDF的某一页到本地
 */
+ (void) saveOnePDFPageWithDocument:(ReaderDocument *)document pdfID:(NSString *)pdfID FileName:(NSString *)fileName;
/**
   删除保存在本地的PDF、通过相同的文件名删除
 */
+ (void) deleteOnePDFPageWithDocument:(ReaderDocument *)document pdfID:(NSString *)pdfID FileName:(NSString *)fileName;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com