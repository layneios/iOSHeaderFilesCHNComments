//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/****************** NSJSONSerialization : NSObject ******************/
/**
 *  判断给定对象是否能转换成 JSON 格式的字符串
 */
+ (BOOL)isValidJSONObject:(id)obj;

/**
 *  将指定的 OC 对象转换成 JSON 格式的字符串
 *
 *  @param obj   要转换的OC对象(字典或者数组)
 *  @param opt   0 转换过程中没有附加选项 NSJSONWritingPrettyPrinted=1 转换带格式的JSON字符串
 *  @param error 出错参数 通常传入 NULL
 */
+ (NSData *)dataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error;

/**
 *  Serialization 序列化 － 网络上传输的所有数据都是二进制的
 *  - 序列化    将OC中的对象(数组/字典)发送给服务器之前 转换成二进制数据的过程
 *  - 反序列化  获得服务器返回的二进制数据后 转换成 OC 对象(数组/字典)的过程 便于后续的字典转模型数据解析
 *
 *  @param data  二进制数据
 *  @param opt   选项
 *  @param error 错误 通常传入 NULL 就行
 *
 *  @return 解析JSON文件
 *
 *  opt 选项
 *  NSJSONReadingMutableContainers = (1UL << 0)    容器可变
 *  NSJSONReadingMutableLeaves = (1UL << 1)        叶子可变 字符串的会使用 NSMutableString
 *  NSJSONReadingAllowFragments(片段，碎片) = (1UL << 2)  允许根节点不是数组或者字典 极少见
 *  按位枚举 如果传入 0 执行效率最高 表示不做任何附加操作
 */
+ (id)JSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError **)error;





