//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//
//  NSOperation 是基于 GCD 做的面向对象的封装 是个抽象类 不能直接使用
//  将 NSOperation 添加到 NSOperationQueue 就可以实现多线程编程


/************************ NSOperation : NSObject ********************/
/**
 *  在当前线程启动操作
 */
- (void)start;

/**
 *  自定义 NSOperation 时 将要执行的代码写在 main 方法中
 *  操作被调度时 会自动执行 main 方法中的代码
 *  自定义操作的执行代码需要添加自动释放池
 */
- (void)main;

/**
 *  获取当前操作是否被取消
 *  在自定义 NSOperation 中 通过对 isCancelled 属性判断 可以做到取消后续代码的执行
 */
@property (readonly, getter=isCancelled) BOOL cancelled;

/**
 *  取消操作
 */
- (void)cancel;

/**
 *  在自定义 NSOperation 时 用于指定完成后的操作回调方法
 *  回调方法会在操作执行完成后 自动被调用
 *  回调方法是在后台线程执行的 如果需要在完成后更新UI 需要注意指定主线程
 *  即使任务被取消回调方法仍然会被调用
 */
@property (copy) void (^completionBlock)(void);

/**
 *  添加依赖
 *
 *  @param op op操作
 */
- (void)addDependency:(NSOperation *)op;

/**
 *  删除依赖
 *
 *  @param op op操作
 */
- (void)removeDependency:(NSOperation *)op;

/**
 *  依赖数组
 */
@property (readonly, copy) NSArray *dependencies;


/************************ NSBlockOperation : NSOperation ********************/
/**
 *  添加一个块操作
 *
 *  @param block block块
 *
 *  @return 返回一个 NSBlockOperation 实例块操作
 */
+ (instancetype)blockOperationWithBlock:(void (^)(void))block;
/**
 *  添加执行块
 *
 *  @param block 执行块
 */
- (void)addExecutionBlock:(void (^)(void))block;
/**
 *  执行块数组
 */
@property (readonly, copy) NSArray *executionBlocks;


/********************** NSInvocationOperation : NSOperation ********************/
/**
 *  创建一个invocationOperation操作
 *
 *  @param target 提供 SEL 方法的对象 通常是 self
 *  @param sel    SEL 方法
 *  @param arg    传递给 SEL 方法的对象
 *
 *  @return 返回一个NSInvocationOperation操作实例
 */
- (instancetype)initWithTarget:(id)target selector:(SEL)sel object:(id)arg;


/********************** NSOperationQueue : NSObject ********************/
// 提示：在开发中 通常会建立一个全局的队列 统一管理所有异步任务的调度
/**
 *  添加一个操作 会自动异步执行
 *
 *  @param op op操作
 */
- (void)addOperation:(NSOperation *)op;

/**
 *  添加多个操作
 *
 *  @param ops  操作数组
 *  @param wait 是否等待操作完成
 */
- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait;

/**
 *  直接将 block 当作操作添加
 *
 *  @param block block块
 */
- (void)addOperationWithBlock:(void (^)(void))block;

/**
 *  队列中的操作
 */
@property (readonly, copy) NSArray *operations;

/**
 *  操作数量
 */
@property (readonly) NSUInteger operationCount;

/**
 *  最大并发操作数 默认数值 -1 表示不限制最大并发线程数
 */
@property NSInteger maxConcurrentOperationCount;

/**
 *  挂起
 *  设置为 YES 队列暂停调度
 *  设置为 NO 队列恢复调度
 *  提示: 将 suspended设置为 YES 如果已经被调度执行的任务会继续执行
 */
@property (getter=isSuspended) BOOL suspended;

/**
 *  队列名称
 */
@property (copy) NSString *name;

/**
 *  取消所有操作
 */
- (void)cancelAllOperations;

/**
 *  阻塞式方法 等待所有操作执行完成
 *  类似于 GCD 调度组中的 dispatch_group_wait 函数
 *  提示：如果使用了阻塞式方法等待队列完成 则在所有操作执行完毕之前无法取消
 */
- (void)waitUntilAllOperationsAreFinished;

/**
 *  获取当前队列
 */
+ (NSOperationQueue *)currentQueue;

/**
 *  获取主队列
 */
+ (NSOperationQueue *)mainQueue;

























