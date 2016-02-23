//
//  CustomTextCell.m
//  AssemblyTableview
//
//  Created by melody on 16/2/18.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "CustomTextCell.h"

@implementation CustomTextCellObject

+ (instancetype)objectWithTitle:(NSString *)title {
    CustomTextCellObject* object = [[[self class] alloc] init];
    object.title = title;
    return object;
}

- (Class)cellClass{
    return [CustomTextCell class];
}

@end

@implementation CustomTextCell

- (BOOL)shouldUpdateCellWithObject:(id)object{
    self.textLabel.text = ((CustomTextCellObject*)object).title;

    return YES;
}

+(CGFloat)heightForObject:(id)object atIndexPath:(NSIndexPath *)indexPath tableView:(UITableView *)tableView{
    return 100;
}



@end
