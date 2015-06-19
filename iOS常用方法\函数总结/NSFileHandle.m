//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/**
 *  NSFileHandle 文件“句柄(指针)” 如果看到类名有 Handle 通常表示对前面的单词(File)的独立操作 操作 操纵
 *
 *  @param path 文件路径
 *
 *  @return 返回一个文件句柄实例对象 如果文件不存在 fp == nil
 */
+ (instancetype)fileHandleForWritingAtPath:(NSString *)path;

/**
 *  将文件指针挪动到文件末尾
 *
 *  @return return value description
 */
- (unsigned long long)seekToEndOfFile;

/**
 *  写入文件
 *
 *  @param data 二进制数据
 */
- (void)writeData:(NSData *)data;

/**
 *  关闭文件
 */
- (void)closeFile;