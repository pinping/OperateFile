/** 
	@file	UIImage+PPImageScale.h
	@brief
	@author	pinping
	@version 1.0.0
	@data	13-3-22
	  Copyright (c) 2013年 maclove. All rights reserved.
	每日壹壳
*/



#import <UIKit/UIKit.h>

@interface UIImage (PPImageScale)


- (UIImage *)scaleToWidth:(float)width;

- (UIImage *)scaleToHeight:(float)height;

- (UIImage *)scaleToSize:(CGSize)size;

@end
