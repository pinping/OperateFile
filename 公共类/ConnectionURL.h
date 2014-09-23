//
//  ConnectionURL.h
//  PPPublicClass
//
//  Created by pinping on 14-8-5.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"


@interface ConnectionURL : NSObject


/**
 *  基本Get链接服务器的基本方法
 *
 *  @param url 链接地址
 *
 *  @return 服务器返回的数据
 */
+ (id)baseConnectionURL:(NSString *)url;


/**
 *POST 提交 并可以上传图片目前只支持单张
 */
+ (NSString *)postRequestWithURL: (NSString *)url  // IN
                      postParems: (NSMutableDictionary *)postParems // IN 提交参数据集合
                     picFilePath: (NSString *)picFilePath  // IN 上传图片路径
                     picFileName: (NSString *)picFileName;  // IN 上传图片名称

/**
 * 修发图片大小
 */
+ (UIImage *) imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
/**
 * 保存图片
 */
+ (NSString *)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName;
/**
 * 生成GUID
 */
+ (NSString *)generateUuidString;


@end
