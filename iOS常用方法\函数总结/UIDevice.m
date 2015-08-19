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
 *  设备名称  e.g. "My iPhone"
 */
@property (nonatomic, readonly, retain) NSString *name;

/**
 *  设备模式  e.g. @"iPhone", @"iPod touch"
 */
@property (nonatomic, readonly, retain) NSString *model;

/**
 *  本地设备模式
 */
@property (nonatomic, readonly, retain) NSString *localizedModel;

/**
 *  设备的系统名称  e.g. @"iOS"
 */
@property (nonatomic, readonly, retain) NSString *systemName;

/**
 *  设备的系统版本  e.g. @"4.0"
 */
@property (nonatomic, readonly, retain) NSString *systemVersion;

/**
 *  设备当前旋转方向
 */
@property (nonatomic, readonly) UIDeviceOrientation orientation;

/**
 *  设备的 UUID
 */
@property (nonatomic, readonly, retain) NSUUID *identifierForVendor NS_AVAILABLE_IOS(6_0);

/**
 *  当前设备是否有转向通知
 */
@property (nonatomic, readonly, getter=isGeneratingDeviceOrientationNotifications) BOOL generatesDeviceOrientationNotifications;

/**
 *  是否监测电池状态 默认是 NO
 */
@property (nonatomic, getter=isBatteryMonitoringEnabled) BOOL batteryMonitoringEnabled;

/**
 *  设备电池状态
 */
@property (nonatomic, readonly) UIDeviceBatteryState batteryState;

/**
 *  设备电量等级 0~1, 如果设备电池状态为 UIDeviceBatteryStateUnknown,则为-1
 */
@property (nonatomic, readonly) float batteryLevel;

/**
 *  是否启用接近感应器监控 默认是 NO
 */
@property (nonatomic, getter=isProximityMonitoringEnabled) BOOL proximityMonitoringEnabled; // default is NO

/**
 *  如果没有接近感应器返回 NO
 */
@property (nonatomic, readonly) BOOL proximityState;

/**
 *  是否支持多任务
 */
@property (nonatomic, readonly, getter=isMultitaskingSupported) BOOL multitaskingSupported;

/**
 *  用户界面模式
 */
@property(nonatomic,readonly) UIUserInterfaceIdiom userInterfaceIdiom;




