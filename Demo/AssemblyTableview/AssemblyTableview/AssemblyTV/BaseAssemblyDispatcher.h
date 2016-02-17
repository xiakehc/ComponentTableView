//
//  BaseAssemblyTableViewController.h
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAssemblyTableView.h"

@interface BaseAssemblyDispatcher : UIViewController<BaseAssemblyTableViewDelegate,UITableViewDataSource,UITableViewDelegate>
/*
 * 数据传递。(注:可考虑reactivecocoa)
 */
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) BaseAssemblyTableView *tableView;

- (NSArray *)components;

@end
