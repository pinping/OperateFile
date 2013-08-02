/** 
	@file	UIImage+PPImageScale.h
	@brief
	@author	pinping
	@version 1.0.0
	@data	13-3-22
  Copyright (c) 2013年 maclove. All rights reserved.
*/
#import <UIKit/UIKit.h>

@interface UIImage (PPImageScale)

- (id)createRoundedRectImage:(UIImage *)image size:(CGSize)size ovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight;

- (UIImage *)PPImgScaleToWidth:(float)width;

- (UIImage *)PPImgScaleToHeight:(float)height;

- (UIImage *)PPImgScaleToSize:(CGSize)size;

- (UIImage *)PPreSizeImage:(CGSize)reSize;

- (UIImage *)fixOrientation;

@end
