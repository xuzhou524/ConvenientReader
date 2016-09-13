//
//	ReaderBookDelegate.m
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import "ReaderBookDelegate.h"
#import "ReaderViewController.h"

@interface ReaderBookDelegate () <ReaderViewControllerDelegate>

@end

@implementation ReaderBookDelegate
{
	UIWindow *mainWindow; // Main App Window

	ReaderViewController *readerViewController;
}

#pragma mark - UIApplicationDelegate methods

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	mainWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds]; // Main application window

	mainWindow.backgroundColor = [UIColor grayColor]; // Neutral gray window background color

	NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)

	NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];

	NSString *filePath = [pdfs lastObject]; assert(filePath != nil); // Path to last PDF file

	ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];

	if (document != nil) // Must have a valid ReaderDocument object in order to proceed
	{
		readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];

		readerViewController.delegate = self; // Set the ReaderViewController delegate to self

		mainWindow.rootViewController = readerViewController; // Set the root view controller
	}

	[mainWindow makeKeyAndVisible];

	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of
	// temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application
	// and it begins the transition to the background state. Use this method to pause ongoing tasks, disable timers,
	// and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough
	// application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of transition from the background to the inactive state: here you can undo many
	// of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive.
	// If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate.
	// See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	// Free up as much memory as possible by purging cached data objects that can be recreated
	// (or reloaded from disk) later.
}

#pragma mark - ReaderViewControllerDelegate methods

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
	// Do nothing
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com