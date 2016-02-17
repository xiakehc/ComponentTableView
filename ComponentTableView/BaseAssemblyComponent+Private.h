//
//  BaseAssemblyComponent+Private.h
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "BaseAssemblyComponent.h"
#import "BaseAssemblyTableView.h"

@interface BaseAssemblyComponent (Private)
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) BaseAssemblyTableView *tableView;
@property (copy, nonatomic) NSString *componentType;
@property (strong, nonatomic) NSArray *componentSections;

@end
