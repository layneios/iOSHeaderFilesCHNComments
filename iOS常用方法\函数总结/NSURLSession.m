//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************ NSURLSession : NSObject ********************/
/**
 *  实例化一个单例NSURLSession对象
 *
 *  @return 返回NSURLSession单例对象
 */
+ (NSURLSession *)sharedSession;

/**
 *  从给定url路径建立一个下载任务
 *
 *  @param url url路径
 *
 *  @return 返回一个下载任务
 */
- (NSURLSessionDownloadTask *)downloadTaskWithURL:(NSURL *)url;

/**
 *  实例化一个NSURLSession对象
 *
 *  @param configuration 配置
 *  @param delegate      代理
 *  @param queue         指定"代理"工作的队列
 *
 *  @return 实例化一个 NSURLSession
 *
 *  delegateQueue 只是指定"代理"工作的队列 不会影响 sessionTask 的线程
 */
+ (NSURLSession *)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration delegate:(id <NSURLSessionDelegate>)delegate delegateQueue:(NSOperationQueue *)queue;

/**
 *  使用续传数据 发起下载任务
 *
 *  @param resumeData 续传数据
 *
 *  @return 返回下载任务
 */
- (NSURLSessionDownloadTask *)downloadTaskWithResumeData:(NSData *)resumeData;

/****************** NSURLSessionDelegate <NSObject> ******************/
/**
 *  要信任服务器的证书 需要通过completionHandler通知服务器 客户端的选择
 *
 *  @param session           session 会话
 *  @param challenge         挑战 风险 质询 - 询问用户是否信任证书 身份质询中包含有"受保护空间""证书"
 *  @param completionHandler 完成回调
 *  默认端口号 https: 443 http: 80
 *
 *  NSURLSessionAuthChallengeDisposition 处置 对证书的处置
 *  NSURLSessionAuthChallengeUseCredential = 0 使用指定的"凭据" 就是保存在受保护空间内的证书
 *  NSURLSessionAuthChallengePerformDefaultHandling = 1 默认处理 如果没有安装过证书 会忽略
 *  NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2 整个请求忽略质询
 *  NSURLSessionAuthChallengeRejectProtectionSpace = 3 本次取消 下次再试
 */
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler;

/*************** NSURLSessionTaskDelegate <NSURLSessionDelegate> ****************/
/**
 *  上传的代理方法
 *
 *  @param bytesSent                本次发送字节数
 *  @param totalBytesSent           已经发送字节数
 *  @param totalBytesExpectedToSend 总字节数
 *
 *  如果要跟进上传的进度 仍然可以使用 block 调用 直接实现代理方法即可
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend;

/****************** NSURLSessionDownloadDelegate ******************/
/**
 *  下载代理方法 下载完成之后调用 此方法"必须实现"
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location;

/**
 *  下载代理方法 正在下载数据
 *
 *  @param bytesWritten              本次下载字节数
 *  @param totalBytesWritten         已经下载字节数
 *  @param totalBytesExpectedToWrite 总大小
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;

/**
 *  下载续传的代理方法 几乎没什么用
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes;


/****************** NSURLSessionDownloadTask : NSURLSessionTask ******************/
/**
 *  暂停下载任务
 *
 *  @param completionHandler 块代码内部的方法只允许执行一次 记录续传数据
 */
- (void)cancelByProducingResumeData:(void (^)(NSData *resumeData))completionHandler;


/****************** NSURLSessionConfiguration : NSObject ******************/
/**
 *  替代 request 中的 forHTTPHeaderField 告诉服务器有关客户端的附加信息
 *  HTTPAdditionalHeaders 附加头信息字典 所有要告诉服务器的附加信息 都可以在这个字典中指定
 *  Authorization Content-Type User-Agent...
 *  指定了一组默认的可以设置出站请求的数据头
 */
@property (copy) NSDictionary *HTTPAdditionalHeaders;

/**
 *  返回标准配置 实际上与NSURLConnection的网络协议栈是一样的
 *  具有相同的共享NSHTTPCookieStorage 共享NSURLCache和共享NSURLCredentialStorage
 *
 *  @return 返回标准配置
 */
+ (NSURLSessionConfiguration *)defaultSessionConfiguration;

/**
 *  返回一个预设配置 没有持久性存储的缓存 Cookie或证书 这对于实现像"秘密浏览"功能的功能来说 是很理想的
 *
 *  @return 返回一个预设配置
 */
+ (NSURLSessionConfiguration *)ephemeralSessionConfiguration;

/**
 *  独特之处在于 它会创建一个后台会话 后台会话不同于常规的 普通的会话
 *  它甚至可以在应用程序挂起 退出 崩溃的情况下运行上传和下载任务
 *
 *  @param identifier 初始化时指定的标识符 被用于向任何可能在进程外恢复后台传输的守护进程提供上下文
 *
 *  @return 创建一个后台会话
 */
+ (NSURLSessionConfiguration *)backgroundSessionConfigurationWithIdentifier:(NSString *)identifier NS_AVAILABLE(10_10, 8_0);

/**
 *  网络服务类型 对标准的网络流量 网络电话 语音 视频 以及由一个后台进程使用的流量进行了区分
 *  大多数应用程序都不需要设置这个
 */
@property NSURLRequestNetworkServiceType networkServiceType;

/**
 *  allowsCellularAccess(允许蜂窝访问) discretionary(自行决定)
 *  被用于节省通过蜂窝连接的带宽
 *  建议在使用后台传输的时候 使用discretionary属性 而不是allowsCellularAccess属性
 *  因为它会把WiFi和电源可用性考虑在内
 */
@property BOOL allowsCellularAccess;
@property (getter=isDiscretionary) BOOL discretionary NS_AVAILABLE(10_10, 7_0);

/**
 *  指定请求以及该资源的超时时间间隔
 *  许多开发人员试图使用timeoutInterval去限制发送请求的总时间
 *  但这误会了timeoutInterval的意思 报文之间的时间
 *  timeoutIntervalForResource实际上提供了整体超时的特性 这应该只用于后台传输 而不是用户实际上可能想要等待的任何东西
 */
@property NSTimeInterval timeoutIntervalForRequest;
@property NSTimeInterval timeoutIntervalForResource;

/**
 *  Foundation 框架中URL加载系统的一个新的配置选项
 *  用于可以在需要时限制连接到特定主机的数量
 */
@property NSInteger HTTPMaximumConnectionsPerHost;

/**
 *  可以被用于开启HTTP管道 可以显著降低请求的加载时间 但是由于没有被服务器广泛支持 默认是禁用的
 */
@property BOOL HTTPShouldUsePipelining;

/**
 *  该属性指定该会话是否应该从后台启动
 */
@property BOOL sessionSendsLaunchEvents NS_AVAILABLE(NA, 7_0);

/**
 *  指定了会话连接中的代理服务器
 *  大多数面向消费者的应用程序都不需要代理 所以基本上不需要配置这个属性
 *  关于连接代理的更多信息可以在 CFProxySupport Reference 找到
 */
@property (copy) NSDictionary *connectionProxyDictionary;

/**
 *  被会话使用的cookie存储
 *  默认情况下 NSHTTPCookieStorage 的 +sharedHTTPCookieStorage会被使用 这与NSURLConnection是相同的
 */
@property (retain) NSHTTPCookieStorage *HTTPCookieStorage;

/**
 *  决定了该会话应该接受从服务器发出的cookie的条件
 */
@property NSHTTPCookieAcceptPolicy HTTPCookieAcceptPolicy;

/**
 *  指定了请求是否应该使用会话HTTPCookieStorage的cookie
 */
@property BOOL HTTPShouldSetCookies;

/**
 *  会话使用的证书存储
 *  默认情况下 NSURLCredentialStorage 的 +sharedCredentialStorage 会被使用使用 这与NSURLConnection是相同的
 */
@property (retain) NSURLCredentialStorage *URLCredentialStorage;

/**
 *  确定是否支持SSLProtocol版本的会话
 */
@property SSLProtocol TLSMinimumSupportedProtocol;
@property SSLProtocol TLSMaximumSupportedProtocol;

/**
 *  会话使用的缓存
 *  默认情况下 NSURLCache 的 +sharedURLCache 会被使用 这与NSURLConnection是相同的
 */
@property (retain) NSURLCache *URLCache;

/**
 *  指定了一个请求的缓存响应应该在什么时候返回
 *  这相当于 NSURLRequest 的-cachePolicy方法
 */
@property NSURLRequestCachePolicy requestCachePolicy;

/**
 *  注册NSURLProtocol类的特定会话数组
 */
@property (copy) NSArray *protocolClasses;











