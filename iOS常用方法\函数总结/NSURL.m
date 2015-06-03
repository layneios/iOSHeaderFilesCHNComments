//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/****************** NSURL: NSObject ******************/
/**
 *  使用指定的字符串实例化 NSURL 对象
 *  注意:URL字符串中不能包含空格 中文等特殊符号 如果有特殊符号需要添加百分号转义
 */
+ (instancetype)URLWithString:(NSString *)URLString;

/**
 *  完整的字符串
 */
@property (readonly, copy) NSString *absoluteString;

/**
 *  参照路径 用于 file:// URL
 */
@property (readonly, copy) NSURL *baseURL;

/**
 *  协议头字符串
 */
@property (readonly, copy) NSString *scheme;

/**
 *  不包含协议头的剩余内容
 */
@property (readonly, copy) NSString *resourceSpecifier;

/**
 *  主机地址
 */
@property (readonly, copy) NSString *host;

/**
 *  端口 nil 使用默认端口 80
 */
@property (readonly, copy) NSNumber *port;

/**
 *  不包含协议头/主机地址/端口/参数
 */
@property (readonly, copy) NSString *path;

/**
 *  查询参数字符串
 */
@property (readonly, copy) NSString *query;


/****************** NSString (NSURLUtilities) ******************/
/**
 *  字符串的对象方法 将某个字符串进行百分号转义处理
 *
 *  @param enc 编码方式 NSUTF8StringEncoding
 *
 *  @return 返回百分号转义好的字符串对象
 */
- (NSString *)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc;


/****************** NSURL (NSURLPathUtilities) ******************/
/**
 *  包含路径组成部分的数组
 */
@property (readonly, copy) NSArray *pathComponents











