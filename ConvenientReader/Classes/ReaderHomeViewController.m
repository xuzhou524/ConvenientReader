//
//  ReaderHomeViewController.m
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import "ReaderHomeViewController.h"
#import "ReaderViewController.h"

@interface ReaderHomeViewController ()<ReaderViewControllerDelegate>

@end

@implementation ReaderHomeViewController
#define DEMO_VIEW_CONTROLLER_PUSH FALSE
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor]; // Transparent
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    self.title = [[NSString alloc] initWithFormat:@"%@", name];
    
    CGSize viewSize = self.view.bounds.size;
    CGRect labelRect = CGRectMake(0.0f, 0.0f, 80.0f, 32.0f);
    
    UILabel *tapLabel = [[UILabel alloc] initWithFrame:labelRect];
    
    tapLabel.text = @"Go";
    tapLabel.textColor = [UIColor whiteColor];
    tapLabel.textAlignment = NSTextAlignmentCenter;
    tapLabel.backgroundColor = [UIColor clearColor];
    tapLabel.font = [UIFont systemFontOfSize:24.0f];
    tapLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    tapLabel.autoresizingMask |= UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    tapLabel.center = CGPointMake(viewSize.width * 0.5f, viewSize.height * 0.5f);
    
    [self.view addSubview:tapLabel];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleTap]; 

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) // See README
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
    else
        return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
    NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    NSString *filePath = [pdfs firstObject]; assert(filePath != nil); // Path to first PDF file
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
    {
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
        [self.navigationController pushViewController:readerViewController animated:YES];
#else // present in a modal view controller
        readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:readerViewController animated:YES completion:NULL];
#endif // DEMO_VIEW_CONTROLLER_PUSH
    }
    else // Log an error so that we know that something went wrong
    {
        NSLog(@"%s [ReaderDocument withDocumentFilePath:'%@' password:'%@'] failed.", __FUNCTION__, filePath, phrase);
    }
}

#pragma mark - ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
    
    [self.navigationController popViewControllerAnimated:YES];
    
#else // dismiss the modal view controller
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
#endif // DEMO_VIEW_CONTROLLER_PUSH
}
@end
