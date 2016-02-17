//
//  UIListTimeComponent
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "UIListTimeComponent.h"
#import "SubDetailViewController.h"
#import "ListTableViewCell.h"
#import "BaseAssemblyComponent+Private.h"

static NSString *cellIdentifier = @"ListCellIdentifier";

@interface UIListTimeComponent()
@property (nonatomic,strong) NSMutableArray* listData;
@end

@implementation UIListTimeComponent
- (void)assemblyComponentWillAppear:(BOOL)animated{
    NSLog(@"UIListTimeComponent WillAppear");
}

- (void)assemblyComponentWillDisappear:(BOOL)animated{
      NSLog(@"UIListTimeComponent WillDisappear");
}

- (void)setupComponent{
    self.listData = [self.dataDictionary objectForKey:@"UIListTimeComponentKey"];
    [self registerClass:[ListTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
}

#pragma mark - TB
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = (ListTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell updateData:[self.listData objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"UIListTimeComponent is select:%ld", (long)indexPath.row);
    SubDetailViewController *vc = [[SubDetailViewController alloc]init];
    vc.view.frame = tableView.frame;
    [self.navigationController pushViewController:vc animated:YES];
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
