//
//  BaseAssemblyTableView.h
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseAssemblyTableView;

@protocol BaseAssemblyTableViewDelegate <NSObject>

@optional
- (void)tableViewWillReloadData:(BaseAssemblyTableView *)tableView;

@end

typedef enum : NSUInteger {
    BaseCellMarginType_Detail,
    BaseCellMarginType_List,
} BaseCellMarginType;

typedef enum : NSUInteger {
    BaseCellLineType_Top,
    BaseCellLineType_Center,
    BaseCellLineType_Bottom
} BaseCellLineType;

@interface BaseAssemblyTableView : UITableView
@property (weak, nonatomic) id<BaseAssemblyTableViewDelegate> baseDelegate;

/*
 * 扩展TB样式(包括布局、分割线 ... )
 */
@property (assign, nonatomic) BaseCellMarginType cellMarginType;

@property (assign, nonatomic) BaseCellLineType cellLineType;

@end
