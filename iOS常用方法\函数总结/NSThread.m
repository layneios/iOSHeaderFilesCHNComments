//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//

/************************ NSThread : NSObject ********************/
/**
 *  创建并启动线程
 *
 *  @param selector selector 方法
 *  @param target   提供 selector 方法的对象 通常是 self
 *  @param argument 传递给 selector 方法的参数
 */
+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument;

/**
 *  创建新的线程
 *
 *  @param target   提供 selector 方法的对象 通常是 self
 *  @param selector selector 方法
 *  @param argument 传递给 selector 方法的参数
 */
- (instancetype)initWithTarget:(id)target selector:(SEL)selector object:(id)argument;

/**
 *  线程的名字 在多个线程开发时 可以用来判断到底是谁在执行任务
 */
@property (copy) NSString *name;

/**
 *  线程的优先级 取值范围 0.0 到 1.0
 *
 *  默认优先级 0.5
 *  1.0表示优先级最高
 *  优先级高表示CPU调度的频率相对较高
 */
+ (double)threadPriority;

/**
 *  只读属性 线程是否正在执行
 */
@property (readonly, getter=isExecuting) BOOL executing;

/**
 *  只读属性 线程是否完成
 */
@property (readonly, getter=isFinished) BOOL finished;

/**
 *  只读属性 线程是否被取消
 */
@property (readonly, getter=isCancelled) BOOL cancelled;

/**
 *  线程执行前 堆栈大小512K
 *  线程完成后 堆栈大小0K 内存空间被释放
 *  注意:线程执行完毕后 由于内存空间已经被释放 不能再次启动
 */
@property NSUInteger stackSize;

/**
 *  将线程对象加入可调度线程池等待CPU调度
 */
- (void)start;

/**
 *  通知线程取消 可以在外部终止线程执行
 *  在线程执行方法中需要增加 isCancelled 判断 如果 isCancelled == YES，直接返回
 */
- (void)cancel;

/**
 *  当前线程 在开发中常用于调试 适用于所有线程技术
 *  number == 1 表示主线程, number != 1 表示后台线程
 */
+ (NSThread *)currentThread;

/**
 *  休眠到指定的时间
 */
+ (void)sleepUntilDate:(NSDate *)date;

/**
 *  休眠指定的时长
 */
+ (void)sleepForTimeInterval:(NSTimeInterval)ti;

/**
 *  中止当前线程的执行 线程被中止后 后续代码都不会执行 注意:不要在主线程中调用此方法
 */
+ (void)exit;

/**
 *  是否主线程
 */
+ (BOOL)isMainThread;

/**
 *  返回主线程对象
 */
+ (NSThread *)mainThread;

/**
 *  是否多线程
 */
+ (BOOL)isMultiThreaded;


/************************ NSObject (NSThreadPerformAdditions) ********************/
/**
 *  在主线程执行 selector 方法
 *
 *  @param aSelector selector 方法
 *  @param arg       传递给 selector 方法的参数
 *  @param wait      是否等待 selector 方法执行结束
 */
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait;

/**
 *  在指定线程执行 selector 方法
 *
 *  @param aSelector selector 方法
 *  @param thr       线程对象
 *  @param arg       传递给 selector 方法的参数
 *  @param wait      是否等待 selector 方法执行结束
 */
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait;

/**
 *  隐式创建并启动线程
 *
 *  @param aSelector selector 方法
 *  @param arg       传递给 selector 方法的参数
 */
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;






















