//
//  Created by Lining on 15/4/7.
//  Copyright (c) 2015年. All rights reserved.
//


/**
 *  数据源(用来告诉UIPickerView有多少列多少行)
 */
@property (nonatomic,assign) id<UIPickerViewDataSource> dataSource;

/**
 *  代理(用来告诉UIPickerView每1列的每1行显示什么内容,监听UIPickerView的选择)
 */
@property(nonatomic,assign) id<UIPickerViewDelegate> delegate;

/**
 *  是否要显示选中的指示器
 */
@property(nonatomic) BOOL showsSelectionIndicator;

/**
 *  一共有多少列
 */
@property(nonatomic,readonly) NSInteger numberOfComponents;

/**
 *  重新刷新所有列
 */
- (void)reloadAllComponents;

/**
 *  重新刷新第component列
 */
- (void)reloadComponent:(NSInteger)component;

/**
 *  主动选中第component列的第row行
 */
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;

/**
 *  获得第component列的当前选中的行号
 */
- (NSInteger)selectedRowInComponent:(NSInteger)component;

/************************* UIPickerViewDataSource数据源方法 ****************************/
/**
 *  一共有多少列
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

/**
 *  第component列一共有多少行
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;


/************************* UIPickerViewDelegate代理方法 ****************************/
/**
 *  第component列的宽度是多少
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;

/**
 *  第component列的行高是多少
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;

/**
 *  第component列第row行显示什么文字
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

/**
 *  第component列第row行显示怎样的view(内容)
 */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;

/**
 *  选中了pickerView的第component列第row行
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;


