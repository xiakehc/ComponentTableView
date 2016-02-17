//
//  UITitleNumberComponent
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "UITitleNumberComponent.h"
#import "TitleTableViewCell.h"

#define KTestReloadTableViewComponent    1

static NSString *cellIdentifier = @"TitleCellIdentifier";

@interface UITitleNumberComponent()
@property (nonatomic,strong) NSMutableArray* listData;
@end

@implementation UITitleNumberComponent

- (void)setupComponent{
    [self doRequest];
    [self registerClass:[TitleTableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)doRequest{
    self.listData =  [NSMutableArray arrayWithObjects:@"Title1",@"Title2",nil];
}

#pragma mark - TB
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TitleTableViewCell *cell = (TitleTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell updateData:[self.listData objectAtIndex:indexPath.row]];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"UIListTimeComponent is select:%ld", (long)indexPath.row);

#if KTestReloadTableViewComponent
    [self.listData addObject:@"测试新添加"];
    [self reloadTableViewComponent];
#elif KTestReloadTableViewComponentRow
    self.listData[0] = @"Title1测试新添加";
    [self reloadTableViewComponentWithRow:0];
#elif KTestReloadTableView
    [self reloadTableView];
#endif
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *sectionView = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 30)];
    sectionView.text = [NSStringFromClass(self.class) stringByAppendingString:@"-HeaderSection"];
    sectionView.backgroundColor = [UIColor blackColor];
    sectionView.textColor = [UIColor whiteColor];
    return sectionView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UILabel *sectionView = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.frame.size.width, 30)];
    sectionView.text = [NSStringFromClass(self.class) stringByAppendingString:@"-FooterSection"];
    sectionView.backgroundColor = [UIColor blackColor];
    sectionView.textColor = [UIColor whiteColor];
    return sectionView;
}

@end
