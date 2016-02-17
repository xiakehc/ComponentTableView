//
//  BaseAssemblyComponent
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseAssemblyComponent : UIViewController<UITableViewDelegate,UITableViewDataSource>
/**
 *  控制模块是否显示
 */
- (BOOL)shouldShowComponent;

#pragma mark - Register Cell

/**
 *  Registers-Class
 */
- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

/**
 *  刷新Tableview
 */
- (void)reloadTableView;

/**
 *  局部刷新Component
 */
- (void)reloadTableViewComponent;

/**
 *  局部刷新Component中的Row
 */
- (void)reloadTableViewComponentWithRow:(NSInteger)row;

#pragma mark - Life Cycle
/**
 *  模块创建后触发相当于ViewDidLoad
 */
- (void)setupComponent;

/**
 *  模块展示时调用相当于ViewWillAppear
 */
- (void)assemblyComponentWillAppear:(BOOL)animated;

/**
 *  模块消失时调用相当于ViewWillAppear
 */
- (void)assemblyComponentWillDisappear:(BOOL)animated;


@end
