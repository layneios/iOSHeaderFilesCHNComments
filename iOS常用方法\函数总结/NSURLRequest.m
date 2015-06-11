//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/****************** NSURLRequest : NSObject ******************/
/**
 *  使用指定的 URL 建立请求 使用系统默认缓存策略 默认超时时长 60 秒
 *
 *  @param URL 资源路径
 *
 *  @return 返回NSURLRequest请求
 */
+ (instancetype)requestWithURL:(NSURL *)URL;

/**
 *  通过url创建一个请求
 *
 *  @param URL             url资源路径
 *  @param cachePolicy     缓存策略 很多网上的代码 选项部分都会写成 0 目的就是让代码短一点
 *  @param timeoutInterval 超时时长 默认是 60s 建议改成 15-30s
 *                         (SDWebImage 默认超时时长 15s 最大并发数 6)  (AFNetworking 默认超时时长 60s)
 *
 *  @return 返回NSURLRequest请求
 *
 *  cachePolicy 缓存策略
 *  NSURLRequestUseProtocolCachePolicy = 0          默认的缓存策略 使用协议的缓存策略
 *  NSURLRequestReloadIgnoringLocalCacheData = 1    对实时性要求高的 忽略本地缓存数据 每次都从服务器上加载
 *
 *  提示：在实际开发中，不建议使用以下两个选项！
 *  NSURLRequestReturnCacheDataElseLoad = 2        如果有缓存 返回缓存 否则加载
 *  NSURLRequestReturnCacheDataDontLoad = 3    如果有缓存 返回缓存 否则不加载
 *
 */
+ (instancetype)requestWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval;

/**
 *  设置请求头
 *
 *  @param value 请求头的field对应的值
 *  @param field 请求头的field
 */
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;


/****************** NSMutableURLRequest (NSMutableHTTPURLRequest)  ****************/
/**
 *  HTTP访问方法 GET(默认) POST PUT DELETE HEAD
 */
@property (copy) NSString *HTTPMethod;

/**
 *  提交给服务器的二进制数据
 */
@property (copy) NSData *HTTPBody;

/**
 *  需要处理 Cookie 默认为 YES
 */
@property BOOL HTTPShouldHandleCookies;

/**
 *  所有HTTP请求头字典
 *
 *  例子:
 *  Host:127.0.0.1                  客户端想访问的服务器主机地址
 *  User-Agent:iPhone AppleWebKit   客户端的类型，客户端的软件环境
 *  Accept: text/html,              客户端所能接收的数据类型
 *  Accept-Language: zh-cn          客户端的语言环境
 *  Accept-Encoding: gzip           客户端支持的数据压缩格式
 *  Content-Length                  提交给服务器的内容长度
 *  Content-Type                    提交给服务器的内容类型
 *  Authorization                   访问服务器的验证信息
 */
@property (copy) NSDictionary *allHTTPHeaderFields;









