//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//

/**
 *  取得当前程序的BundlePath
 */
@property (readonly, copy) NSString *bundlePath;

/**
 *  取得当前程序的boundleId
 */
@property (readonly, copy) NSString *bundleIdentifier;

/**
 *  取得当前程序的主Bundle
 */
+ (NSBundle *)mainBundle;

/**
 *  获取当前程序Bundle目录下的某个文件资源路径
 *  @param name 文件名
 *  @param ext
 *  @return 文件资源路径
 */
- (NSURL *)URLForResource:(NSString *)name withExtension:(NSString *)ext;

/**
 *  获取当前程序Bundle目录下的某个文件全路径
 *  @param name 文件名
 *  @param ext  文件类型 拓展名
 *  @return 文件全路径
 */
- (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext;

