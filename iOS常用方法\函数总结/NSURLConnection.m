//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//

/**
 *  发送网络连接 网络连接是异步的
 *
 *  @param request 请求
 *  @param queue   队列
 *  @param handler 准备好的块代码 在网络访问结束后执行
 *
 *  block中的参数
 *  NSURLResponse 服务器的响应 真实类型 NSHTTPURLResponse 通常只有在开发 "下载" 功能的时候 才会使用
 *  NSData 服务器返回的实体数据 程序员最关心的内容
 *  connectionError 连接错误 在商业软件中 所有的网络操作 都必须处理错误
 */
+ (void)sendAsynchronousRequest:(NSURLRequest*) request
queue:(NSOperationQueue*) queue
completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;

/**
 *  创建网络连接并且开始加载数据 数据的加载事件 通过代理监听
 *
 *  @param request  请求
 *  @param delegate 代理
 *
 *  @return
 */
+ (NSURLConnection *)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate;

/**
 *  接收到服务器的响应 - 给的一个回执，可以做准备工作
 *
 *  @param connection 连接
 *  @param response   响应
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

/**
 *  接收到服务器返回的二进制数据 会执行很多次
 *
 *  @param connection 连接
 *  @param data       数据
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

/**
 *  接收完成－只有 connection参数 没有数据 服务器通知客户端传输完毕 代理方法结束后 连接自动断开
 *
 *  @param connection 连接
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

/**
 *  接收错误
 *
 *  @param connection 连接
 *  @param error      错误
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;





