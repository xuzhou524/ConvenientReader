//
//	ReaderThumbQueue.m
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import "ReaderThumbQueue.h"

@implementation ReaderThumbQueue
{
	NSOperationQueue *loadQueue;

	NSOperationQueue *workQueue;
}

#pragma mark - ReaderThumbQueue class methods

+ (ReaderThumbQueue *)sharedInstance
{
	static dispatch_once_t predicate = 0;

	static ReaderThumbQueue *object = nil; // Object

	dispatch_once(&predicate, ^{ object = [self new]; });

	return object; // ReaderThumbQueue singleton
}

#pragma mark - ReaderThumbQueue instance methods

- (instancetype)init
{
	if ((self = [super init])) // Initialize
	{
		loadQueue = [NSOperationQueue new];

		[loadQueue setName:@"ReaderThumbLoadQueue"];

		[loadQueue setMaxConcurrentOperationCount:1];

		workQueue = [NSOperationQueue new];

		[workQueue setName:@"ReaderThumbWorkQueue"];

		[workQueue setMaxConcurrentOperationCount:1];
	}

	return self;
}

- (void)addLoadOperation:(NSOperation *)operation
{
	if ([operation isKindOfClass:[ReaderThumbOperation class]])
	{
		[loadQueue addOperation:operation]; // Add to load queue
	}
}

- (void)addWorkOperation:(NSOperation *)operation
{
	if ([operation isKindOfClass:[ReaderThumbOperation class]])
	{
		[workQueue addOperation:operation]; // Add to work queue
	}
}

- (void)cancelOperationsWithGUID:(NSString *)guid
{
	[loadQueue setSuspended:YES]; [workQueue setSuspended:YES];

	for (ReaderThumbOperation *operation in loadQueue.operations)
	{
		if ([operation isKindOfClass:[ReaderThumbOperation class]])
		{
			if ([operation.guid isEqualToString:guid]) [operation cancel];
		}
	}

	for (ReaderThumbOperation *operation in workQueue.operations)
	{
		if ([operation isKindOfClass:[ReaderThumbOperation class]])
		{
			if ([operation.guid isEqualToString:guid]) [operation cancel];
		}
	}

	[workQueue setSuspended:NO]; [loadQueue setSuspended:NO];
}

- (void)cancelAllOperations
{
	[loadQueue cancelAllOperations]; [workQueue cancelAllOperations];
}

@end

#pragma mark -

//
//	ReaderThumbOperation class implementation
//

@implementation ReaderThumbOperation
{
	NSString *_guid;
}

@synthesize guid = _guid;

#pragma mark - ReaderThumbOperation instance methods

- (instancetype)initWithGUID:(NSString *)guid
{
	if ((self = [super init]))
	{
		_guid = guid;
	}

	return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com