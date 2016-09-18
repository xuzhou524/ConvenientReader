//
//  ShareViewController.m
//  ConvenientReaderShare
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
@property(nonatomic,strong)NSString * urlString;
@end

@implementation ShareViewController

- (void)viewDidLoad{
    NSExtensionItem * imageItem = [self.extensionContext.inputItems firstObject];
    NSItemProvider * imageItemProvider = [[imageItem attachments] firstObject];
    if([imageItemProvider hasItemConformingToTypeIdentifier:@"com.adobe.pdf"]){
        NSLog(@"xxxxxxxx");
        [imageItemProvider loadItemForTypeIdentifier:@"com.adobe.pdf" options:nil completionHandler:^(NSURL* imageUrl, NSError *error) {
            //在这儿做自己的工作
            NSLog(@"xxxxxxx123 = %@",imageUrl.absoluteString);
            _urlString = imageUrl.absoluteString;
        }];
    }
}
- (BOOL)isContentValid {
    NSExtensionItem * imageItem = [self.extensionContext.inputItems firstObject];
    if(!imageItem){
        return NO;
    }

    NSItemProvider * imageItemProvider = [[imageItem attachments] firstObject];
    if(!imageItemProvider){
        return NO;
    }

    if([imageItemProvider hasItemConformingToTypeIdentifier:@"public.url"]&&self.contentText){
        return YES;
    }
    return YES;
}

- (void)didSelectPost {
    NSExtensionItem * imageItem = [self.extensionContext.inputItems firstObject];
    //完成一些自己的操作 保存，添加 http请求
    UIAlertController * alter = [UIAlertController alertControllerWithTitle:@"11" message:@"111" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alter animated:YES completion:^{
    }];
    NSExtensionItem * outputItem = [imageItem copy];

    outputItem.attributedContentText = [[NSAttributedString alloc] initWithString:self.contentText attributes:nil];
    NSArray * outPutitems= @[outputItem];
    [self.extensionContext completeRequestReturningItems:outPutitems completionHandler:nil];
}

- (NSArray *)configurationItems {
    SLComposeSheetConfigurationItem * oneItem = [[SLComposeSheetConfigurationItem alloc]init];
  
    oneItem.title = @"123";
 
    oneItem.valuePending = NO;
    
    oneItem.tapHandler = ^(void){
        NSLog(@"dsdsdsdsd");
    };
    return @[oneItem];
}

@end
