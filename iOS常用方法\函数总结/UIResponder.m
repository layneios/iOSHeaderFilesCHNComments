//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************ UIResponder : NSObject ********************/
/**
 *  下一个响应者
 */
- (UIResponder*)nextResponder;

/**
 *  是否能成为第一响应者
 */
- (BOOL)canBecomeFirstResponder;

/**
 *  成为第一响应者
 */
- (BOOL)becomeFirstResponder;

/**
 *  是否可以取消第一响应者
 */
- (BOOL)canResignFirstResponder;

/**
 *  取消第一响应者
 */
- (BOOL)resignFirstResponder;

/**
 *  是否是第一响应者
 */
- (BOOL)isFirstResponder;

/**
 *  一根或者多根手指开始触摸，系统会自动调用下面方法
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  一根或者多根手指在移动，系统会自动调用下面方法（随着手指的移动，会持续调用该方法）
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  一根或者多根手指离开，系统会自动调用下面方法
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

/**
 *  触摸结束前，某个系统事件(例如电话呼入)会打断触摸过程，系统会自动调用下面方法
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;