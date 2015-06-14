//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//
//  C 语言的"并发技术"框架 是苹果公司为多核的并行运算提出的解决方案
//  自动管理线程的生命周期(创建线程 调度任务 销毁线程等)
//  只需要告诉 GCD 想要如何执行什么任务 不需要编写任何线程管理代码


/**
 *  创建一个自定义队列
 *
 *  @param label 队列名称
 *  @param attr  队列属性 DISPATCH_QUEUE_SERIAL:串行队列 DISPATCH_QUEUE_CONCURRENT:并发队列
 *
 *  @return 自定义队列
 */
dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);

/**
 *  获取全局队列
 *
 *  @param identifier 在iOS7中表示调度的优先级(让线程响应的更快还是更慢) 在iOS8中表示服务质量 为了在iOS7和iOS8中适配此参数 可以直接传入0
 *  @param flags      为将来保留使用 始终传入0
 *
 *  @return 全局队列
 *
 *  队列的优先级
 *  DISPATCH_QUEUE_PRIORITY_HIGH    2   高优先级
 *  DISPATCH_QUEUE_PRIORITY_DEFAULT 0   默认优先级 自定义队列的优先级都是默认优先级
 *  DISPATCH_QUEUE_PRIORITY_LOW   (-2)  低优先级
 *  DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN 后台优先级
 *
 *  QOS(服务质量) iOS 8.0 推出
 *  QOS_CLASS_USER_INTERACTIVE 用户交互 会要求 CPU 尽可能地调度此任务 耗时操作不应该使用此服务质量
 *  QOS_CLASS_USER_INITIATED   用户发起 比 QOS_CLASS_USER_INTERACTIVE 的调度级别低 但是比默认级别高
 *                             耗时操作不应该使用此服务质量 如果用户希望任务尽快执行完毕返回结果 可以选择此服务质量
 *  QOS_CLASS_DEFAULT     默认 此 QOS 不是为添加任务准备的 主要用于传送或恢复由系统提供的 QOS 数值时使用
 *  QOS_CLASS_UTILITY     实用 耗时操作可以使用此服务质量
 *  QOS_CLASS_BACKGROUND  后台 指定任务以最节能的方式运行
 *  QOS_CLASS_UNSPECIFIED 没有指定 QOS
 */
dispatch_queue_t dispatch_get_global_queue(long identifier, unsigned long flags);

/**
 *  执行异步任务的函数 (不必等待这一句代码执行完 就执行下一句代码就是异步)
 *
 *  @param queue 队列
 *  @param block block块任务
 */
void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);

/**
 *  执行同步任务的函数 (执行完这一句代码 再执行后续的代码就是同步)
 *
 *  @param queue 队列
 *  @param block block块任务
 */
void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);

/**
 *  延时执行
 *
 *  @param when  从现在开始经过多少纳秒
 *  @param queue 调度任务的队列
 *  @param block 异步执行任务
 */
void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block);

/**
 *  创建调度组
 */
dispatch_group_t dispatch_group_create(void);

/**
 *  将调度组添加到队列 执行 block 任务
 *
 *  @param group 调度组
 *  @param queue 队列
 *  @param block block任务
 */
void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block);

/**
 *  当调度组中的所有任务执行结束后 获得通知 统一做后续操作
 *
 *  @param group 调度组
 *  @param queue 队列
 *  @param block block任务
 */
void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block);

/**
 *  以阻塞方式等待调度组中所有任务执行完毕
 *
 *  @param group   调度组
 *  @param timeout 超时时长
 */
long dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout);









