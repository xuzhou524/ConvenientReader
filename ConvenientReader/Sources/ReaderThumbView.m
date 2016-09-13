//
//	ReaderThumbView.m
//  ConvenientReader
//
//  Created by gozap on 16/9/13.
//  Copyright © 2016年 xuzhou. All rights reserved.
//

#import "ReaderThumbView.h"

@implementation ReaderThumbView
{
	NSOperation *_operation;

	NSUInteger _targetTag;
}

#pragma mark - Properties

@synthesize operation = _operation;
@synthesize targetTag = _targetTag;

#pragma mark - ReaderThumbView instance methods

- (instancetype)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame]))
	{
		self.autoresizesSubviews = NO;
		self.userInteractionEnabled = NO;
		self.contentMode = UIViewContentModeRedraw;
		self.autoresizingMask = UIViewAutoresizingNone;
		self.backgroundColor = [UIColor clearColor];

		imageView = [[UIImageView alloc] initWithFrame:self.bounds];

		imageView.autoresizesSubviews = NO;
		imageView.userInteractionEnabled = NO;
		imageView.autoresizingMask = UIViewAutoresizingNone;
		imageView.contentMode = UIViewContentModeScaleAspectFit;

		[self addSubview:imageView];
	}

	return self;
}

- (void)showImage:(UIImage *)image
{
	imageView.image = image; // Show image
}

- (void)showTouched:(BOOL)touched
{
	// Implemented by ReaderThumbView subclass
}

- (void)removeFromSuperview
{
	_targetTag = 0; // Clear target tag

	[self.operation cancel]; // Cancel operation

	[super removeFromSuperview]; // Remove view
}

- (void)reuse
{
	_targetTag = 0; // Clear target tag

	[self.operation cancel]; // Cancel operation

	imageView.image = nil; // Release image
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com