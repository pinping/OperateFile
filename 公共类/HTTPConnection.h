//
//  HTTPConnection.h
//  Fortune
//
//  Created by iMac on 14-9-5.
//  Copyright (c) 2014年 深圳市中科创财富通网络金融有限公司(赵品评). All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>


@protocol HTTPConnectionDelegate;

@interface HTTPConnection : NSObject {
@private
    //
    int _numberOfURLConnection;
    int _maxNumberOfURLConnection;
    NSMutableArray *_marrayTaskDic;
    
    id <HTTPConnectionDelegate> delegate;
}

@property (nonatomic, assign) int maxNumberOfURLConnection;
@property (nonatomic, assign) id <HTTPConnectionDelegate> delegate;

// 根据URL获取Web数据
- (BOOL)requestWebDataWithURL:(NSString *)strURL andParam:(NSDictionary *)dicParam priority:(BOOL)priority;

// 根据URLRequest获取Web数据
- (BOOL)requestWebDataWithRequest:(NSURLRequest *)request andParam:(NSDictionary *)dicParam priority:(BOOL)priority;

//取消网络请求
- (BOOL)cancelRequest:(NSDictionary *)dicParam;

//清空网络请求
- (void)clearRequest;

@end


@protocol HTTPConnectionDelegate <NSObject>

@optional

// 网络数据下载失败
- (void)httpConnect:(HTTPConnection *)httpConnect error:(NSError *)error with:(NSDictionary *)dicParam;

// 服务器返回的HTTP信息头
- (void)httpConnect:(HTTPConnection *)httpConnect receiveResponseWithStatusCode:(NSInteger)statusCode
 andAllHeaderFields:(NSDictionary *)dicAllHeaderFields with:(NSDictionary *)dicParam;

// 服务器返回的部分数据
- (void)httpConnect:(HTTPConnection *)httpConnect receiveData:(NSData *)data with:(NSDictionary *)dicParam;

// 网络数据下载完成
- (void)httpConnect:(HTTPConnection *)httpConnect finish:(NSData *)data with:(NSDictionary *)dicParam;

@end


#ifdef DEBUG

#define HTTPLOG(fmt,...)     NSLog((@"HTTP->%s(%d):"fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)

#else

#define HTTPLOG(fmt,...)     NSLog(fmt,##__VA_ARGS__)

#endif
