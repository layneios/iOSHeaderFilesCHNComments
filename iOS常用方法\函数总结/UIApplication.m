//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************ UIApplication : UIResponder ********************/
/**
 *  用于判断用户是否安装了某个 app，通过 url 是否能打开
 */
- (BOOL)canOpenURL:(NSURL *)url;

/**
 *  应用支持的窗口界面指向
 */
- (NSUInteger)supportedInterfaceOrientationsForWindow:(UIWindow *)window NS_AVAILABLE_IOS(6_0);

/************************ UIApplicationDelegate<NSObject> ********************/
/**
 *  系统时间发生改变
 */
- (void)applicationSignificantTimeChange:(UIApplication *)application;

/**
 *  fetch后台模式下的app可能使后台状态下或者系统方便时获取更新数据成为可能
 *  这个方法会在上述情况下被调用
 *  当这些操作执行完毕后，应该尽快执行回调，这样系统可以精确的估计性能和数据占用
 */
- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0);

/**
 *  一个使用了带有后台配置的 NSURLSession 的应用可能会被启动或从后台恢复，以处理完成会话中的任务，或处理授权
 *  这个方法会根据需要注意的会话标识符而被调用
 *  一旦一个会话从配置对象中被创建并且带有标识符，则会话的代理将开始收到回调
 *  如果这样一个会话已经被创建，例如app正在被恢复则代理将开始收到应用没有任何操作的回调
 *  在你结束处理回调后，你应该自行调用函数回调
 */
- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler NS_AVAILABLE_IOS(7_0);

/**
 *  应用中带有恢复标识符路径的视图控制器
 */
- (UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);

/**
 *  应用可能允许 Extension Point Identifier
 *
 *  应用可能排斥特定的基于 extension point identifier 类型的扩展
 *  常数代表的公共 extension point identifier 将在下一步提供
 *  如果这个方法没有实现，默认行为将允许 extension point identifier
 */
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(NSString *)extensionPointIdentifier NS_AVAILABLE_IOS(8_0);

/**
 *  处理 WatchKit 扩展请求，回复是：XXXX
 */
- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void(^)(NSDictionary *replyInfo))reply NS_AVAILABLE_IOS(8_2);

/**
 *  应用保护的数据将变为不可用时调用
 */
- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application NS_AVAILABLE_IOS(4_0);

/**
 *  应用保护的数据已经变为可用时调用
 */
- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application    NS_AVAILABLE_IOS(4_0);

/**
 *  当用户指示他们想要继续应用中的活动时就会马上在主线程上调用
 *
 *  NSUserActivity 对象可能不会立刻可用，所以使用这个方法相当于有一个机会告诉用户一个活动将很快继续
 *  对于每一次 application:willContinueUserActivityWithType:
 *  调用，在成功的情况下，你将会保证获得一个 application:continueUserActivity: 的调用，
 *  如果遇到一个错误，将会调用 application:didFailToContinueUserActivityWithType:error:
 */
- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType NS_AVAILABLE_IOS(8_0);

/**
 *  当 NSUserActivity 对象可用之后在主线程上调用
 *
 *  使用保存在 NSUserActivity 对象中的数据去重新创建用户正在做的事
 *  你可以创建或获取任意可恢复的对象与它们的活动建立联系并且传递它们给 restorationHandler 回调，
 *  它们将使用 UIResponder restoreUserActivityState: 方法调用用户的活动
 *  调用restorationHandler 是可选的，它可能随后被复制或调用
 *  并且可能会被反弹到主线程去完成它的工作并对所有对象调用restoreUserActivityState
 */
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray *restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0);

/**
 *  如果这个方法被实现，并且在 willContinueUserActivityWithType 调用后不能获取到用户活动，这个方法将被调用
 */
- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error NS_AVAILABLE_IOS(8_0);

/**
 *  当一个被 UIKit 管理的用户活动已经被更新，这个方法将在主线程上被调用
 *  你可以使用这个方法作为最后的机会给用户活动增加额外的数据
 */
- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity NS_AVAILABLE_IOS(8_0);

/**
 *  应该保存app状态
 */
- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);

/**
 *  应该恢复app状态
 */
- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);

/**
 *  即将归档可恢复状态
 */
- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);

/**
 *  已经解档可恢复状态
 */
- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);

/**
 *  应用将要改变状态栏 frame 时调用
 */
- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame;

/**
 *  应用已经改变状态栏frame时调用
 */
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame;

/**
 *  应用将要改变状态栏指向时调用
 */
- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration;

/**
 *  应用已经改变状态栏指向时调用
 */
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation;

/**
 *  应用程序完成启动
 */
- (void)applicationDidFinishLaunching:(UIApplication *)application;

/**
 *  app 即将完成启动，启动参数是：XXXX
 */
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0);

/**
 *  app 完成启动，启动参数是：XXXX
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0);

/**
 *  应用程序即将进入前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application;

/**
 *  app 已经变为活动状态(进入前台)
 */
- (void)applicationDidBecomeActive:(UIApplication *)application;

/**
 *  app 即将推出活动状态(即将进入后台)
 */
- (void)applicationWillResignActive:(UIApplication *)application;

/**
 *  应用程序已经进入后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application;

/**
 *  应用程序手动内存警告
 *
 *  第一次收到将尝试尽可能清理内存，第二次就直接终止应用程序
 */
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application;

/**
 *  app即将被终结
 */
- (void)applicationWillTerminate:(UIApplication *)application;

/**
 *  已经注册用户通知设置
 */
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_AVAILABLE_IOS(8_0);

/**
 *  程序在后台没有被杀死，通过本地通知打开应用的时候会调用该方法
 *  程序在前台的时候，也会调用该方法
 *
 *  @param notification 本地通知
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0);

/**
 *  当用户从本地推送通知中执行一个操作使得app被激活时调用
 *
 *  @param completionHandler 当已经完成处理操作时应当调用回调
 */
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler NS_AVAILABLE_IOS(8_0);

/**
 *  已经使用 deviceToken 注册远程推送通知
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0);

/**
 *  注册远程推送通知失败，错误信息是：XXXX
 */
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0);

/**
 *  已经收到远程推送通知，信息是：XXXX
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0);

/**
 *  当用户从远程推送通知中执行一个操作使得app被激活时调用
 */
- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler NS_AVAILABLE_IOS(8_0);

/**
 *  当 app 被远程推送通知启动或恢复时调用
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0);

/**
 *  只要是由其他应用程序打开的，就会调用此方法，此方法将要被弃用
 *
 *  @param url  其他应用程序 打开当前程序使用的URL
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

/**
 *  一旦重写了新方法，旧方法 handleOpenURL 就不再被执行，但是：很多第三方框架，都建议两个方法全都写
 *
 *  @param url               打开当前应用程序的url
 *  @param sourceApplication 打开当前应用程序的源程序的BundleId
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;



