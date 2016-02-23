//
//  CustomTextCell.h
//  AssemblyTableview
//
//  Created by melody on 16/2/18.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NICellFactory.h"

@interface CustomTextCellObject : NSObject <NICellObject>

+ (instancetype)objectWithTitle:(NSString *)title;

@property (nonatomic, copy) NSString* title;

@end

@interface CustomTextCell : UITableViewCell<NICell>

@end
