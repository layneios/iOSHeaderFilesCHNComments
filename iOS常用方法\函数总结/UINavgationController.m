//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************ UINavigationController : UIViewController ********************/
/**
 *  设置导航栏的背景图片
 */
- (void)setBackgroundImage:(UIImage *)backgroundImage forBarMetrics:(UIBarMetrics)barMetrics;

/**
 *  标题样式 字典中能用到的key在UIKit框架的NSAttributedString.h中
 */
@property(nonatomic,copy) NSDictionary *titleTextAttributes;

/**
 *  导航栏中文字渲染颜色
 */
@property(nonatomic,retain) UIColor *tintColor;

/**
 *  文字属性
 */
- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;

/**
 *  导航栏返回按钮背景
 */
- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;