//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//

/****************** NSFileManager : NSObject ******************/
/**
 *  文件管理单例
 */
+ (NSFileManager *)defaultManager;

/**
 *  获取某个文件的属性
 *
 *  @param path  文件路径
 *  @param error 错误
 *
 *  @return 文件属性字典
 */
- (NSDictionary *)attributesOfFileSystemForPath:(NSString *)path error:(NSError **)error NS_AVAILABLE(10_5, 2_0);

/**
 *  NSDictionary字典的分类
 *
 *  @return 文件的大小
 */
- (unsigned long long)fileSize;

/**
 *  删除某个文件
 *
 *  @param path  文件路径
 *  @param error 错误
 *
 *  @return 返回BOOL值 删除是否成功
 */
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error NS_AVAILABLE(10_5, 2_0);

/**
 *  将某个文件复制到新的路径下
 *
 *  @param srcPath 原文件所在路径
 *  @param dstPath 复制完成副本所在路径
 *  @param error   错误
 *
 *  @return 返回是否复制成功
 */
- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath error:(NSError **)error NS_AVAILABLE(10_5, 2_0);








