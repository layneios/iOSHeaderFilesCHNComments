//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/************************* UIScrollView : UIView ****************************/
/**
 *  指定内容显示的偏移位置
 */
@property(nonatomic) CGPoint contentOffset;

/**
 *  指定内容的滚动区域
 */
@property(nonatomic) CGSize contentSize;

/**
 *  上左下右，逆时针顺序，增加滚动边距
 */
@property(nonatomic) UIEdgeInsets contentInset;

/**
 *  代理
 */
@property(nonatomic,assign) id<UIScrollViewDelegate>      delegate;

/**
 *  是否锁定方向
 */
@property(nonatomic,getter=isDirectionalLockEnabled) BOOL directionalLockEnabled;

/**
 *  是否启用弹簧效果，默认启用
 */
@property(nonatomic) BOOL bounces;

/**
 *  是否允许垂直滚动
 */
@property(nonatomic) BOOL alwaysBounceVertical;

/**
 *  是否允许水平滚动
 */
@property(nonatomic) BOOL alwaysBounceHorizontal;

/**
 *  是否启用分页
 */
@property(nonatomic,getter=isPagingEnabled) BOOL pagingEnabled;

/**
 *  是否启用滚动
 */
@property(nonatomic,getter=isScrollEnabled) BOOL scrollEnabled;

/**
 *  是否显示水平滚动条
 */
@property(nonatomic) BOOL showsHorizontalScrollIndicator;

/**
 *  是否显示垂直滚动条
 */
@property(nonatomic) BOOL showsVerticalScrollIndicator;

/**
 *  滚动条边距
 */
@property(nonatomic) UIEdgeInsets scrollIndicatorInsets;

/**
 *  滚动条样式
 */
@property(nonatomic) UIScrollViewIndicatorStyle indicatorStyle;

/**
 *  手动设置 contentOffset 滚动到指定位置
 *
 *  @param animated 是否动画
 */
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;

/**
 *  最小缩放比例
 */
@property(nonatomic) CGFloat minimumZoomScale;

/**
 *  最大缩放比例
 */
@property(nonatomic) CGFloat maximumZoomScale;

/**
 *  缩放比例
 */
@property(nonatomic) CGFloat zoomScale;

/**
 *  是否滚动到顶部 默认是 YES
 */
@property(nonatomic) BOOL scrollsToTop;

/**
 *  退出键盘模式
 */
@property(nonatomic) UIScrollViewKeyboardDismissMode keyboardDismissMode NS_AVAILABLE_IOS(7_0);


/************************* UIScrollViewDelegate<NSObject> ****************************/
/**
 *  滚动过程中 一直会调用该方法 只要开始滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

/**
 *  开始滚动时调用该方法 在拖拽一次 该方法只调用一次且为最初开始时调用一次
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;

/**
 *  当用户开始缩放动作时代理要触发的事件
 */
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view;

/**
 *  结束拖拽（手指松开）
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

/**
 *  将要开始停止
 */
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;

/**
 *  当用户缩放时 要设置绽放哪个View 返回要被缩放的视图 通过修改视图的 transform 实现的
 *  @return 要缩放的视图
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView

/**
 *  只要缩放就会调用
 */
- (void)scrollViewDidZoom:(UIScrollView *)scrollView;

/**
 *  完成缩放 放开手指时调用
 */
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale;

/**
 *  完全停止滚动调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

/**
 *  滚动到顶部动画完成立即调用
 */
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;

