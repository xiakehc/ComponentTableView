//
//  BaseAssemblyTableView.m
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "BaseAssemblyTableView.h"

@implementation BaseAssemblyTableView
- (void)reloadData
{
    if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(tableViewWillReloadData:)]) {
        [self.baseDelegate tableViewWillReloadData:self];
    }
    [super reloadData];
}

@end
