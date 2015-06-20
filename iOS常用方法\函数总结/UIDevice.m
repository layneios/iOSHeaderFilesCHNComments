//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************ UIDevice : NSObject ********************/
/**
 *  获取当前设备
 */
+ (UIDevice *)currentDevice;

/**
 *  设备的系统名称  e.g. @"iOS"
 */
@property(nonatomic,readonly,retain) NSString *systemName;

/**
 *  设备的系统版本  e.g. @"4.0"
 */
@property(nonatomic,readonly,retain) NSString *systemVersion;