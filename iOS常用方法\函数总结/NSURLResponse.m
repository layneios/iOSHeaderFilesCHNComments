//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/****************** NSURLResponse : NSObject ******************/
/**
 *  返回二进制数据的类型 通过 MIMEType 可以知道如何处理服务器返回的二进制数据
 */
@property (readonly, copy) NSString *MIMEType;

/**
 *  如果是文件下载 会返回要下载文件的长度
 */
@property (readonly) long long expectedContentLength;

/**
 *  建议保存的文件名 可以方便文件下载
 */
@property (readonly, copy) NSString *suggestedFilename;

/**
 *  字符编码名称 在目前的移动互联网开发中 绝大多数情况下都使用 UTF8 编码
 */
@property (readonly, copy) NSString *textEncodingName;




