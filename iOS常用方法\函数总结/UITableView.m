//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//

/// tableView 样式
typedef NS_ENUM(NSInteger, UITableViewStyle) {
    // 默认不分组样式
    UITableViewStylePlain,
    // 分组样式
    UITableViewStyleGrouped
};

/************************* UITableView : UIScrollView ****************************/
/**
 *  全局刷新(每一行都会重新刷新)
 */
- (void)reloadData;

/**
 *  让 tableView 滚动到指定 indexPath 的位置
 */
- (void)scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;

/**
 *  在指定 indexPaths 插入单\多行 cell
 */
- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  在指定 indexPaths 删除单\多行 cell
 */
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  刷新指定 indexPaths 单\多行 cell (使用前提: 刷新前后, 模型数据的个数不变)
 */
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation NS_AVAILABLE_IOS(3_0);

/**
 *  局部删除(使用前提: 模型数据减少的个数 == indexPaths的长度)
 */
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;


/********************** UITableViewDataSource<NSObject> **************************/
/**
 *  设置 tableView 的组数，可以不实现 默认是1
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;

/**
 *  设置 tableView 的行数，必须实现
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

/**
 *  设置 tableView 每一行的 cell，必须实现
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  组头标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;

/**
 *  组尾标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

/**
 *  tableView 右侧的索引数组
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;


/************ UITableViewDelegate<NSObject, UIScrollViewDelegate> ***********/
/**
 *  tableViewCell 将要显示
 */
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  组头视图 将要显示
 */
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

/**
 *  组尾视图 将要显示
 */
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

/**
 *  tableViewCell 完成显示
 */
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath NS_AVAILABLE_IOS(6_0);

/**
 *  组头视图 完成显示
 */
- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

/**
 *  组尾视图 完成显示
 */
- (void)tableView:(UITableView *)tableView didEndDisplayingFooterView:(UIView *)view forSection:(NSInteger)section NS_AVAILABLE_IOS(6_0);

/**
 *  设置 tableView 的行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  设置 tableView 的组头的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

/**
 *  设置 tableView 的组尾的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

/**
 *  将要选中 tableView 的某行
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  将要取消选中 tableView 的某行
 */
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

/**
 *  完成选中了 tableView 的某行
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  完成取消选中 tableView 的某行
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(3_0);

