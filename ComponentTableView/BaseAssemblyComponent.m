//
//  BaseAssemblyComponent.m
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "BaseAssemblyComponent.h"
#import "BaseAssemblyComponent+Private.h"

@interface BaseAssemblyComponent ()

@end

@implementation BaseAssemblyComponent

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)setupComponent
{
    NSLog(@"setupComponent !");
}

- (BOOL)shouldShowComponent{
    return YES;
}

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier{
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
}

- (void)reloadTableView{
    [self.tableView reloadData];
}

- (void)reloadTableViewComponent{
    [self.componentSections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray * arr = ((NSArray*)obj);
        BOOL isContain = [arr containsObject:self.componentType];
        if(isContain){
            NSIndexSet *modulueSet = [[NSIndexSet alloc]initWithIndex:idx];
            [self.tableView reloadSections:modulueSet withRowAnimation:UITableViewRowAnimationNone];
            *stop = YES;
        }
    }];
}

- (void)reloadTableViewComponentWithRow:(NSInteger)row{
    [self.componentSections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray * arr = ((NSArray*)obj);
        BOOL isContain = [arr containsObject:self.componentType];
        if(isContain){
            NSIndexPath *ComponentIndexPath=[NSIndexPath indexPathForRow:row inSection:idx];
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:ComponentIndexPath,nil]  withRowAnimation:UITableViewRowAnimationNone];
            *stop = YES;
        }
    }];
}

- (void)assemblyComponentWillAppear:(BOOL)animated
{
    NSLog(@"assemblyComponentWillAppear !");
}

- (void)assemblyComponentWillDisappear:(BOOL)animated
{
    NSLog(@"assemblyComponentWillDisappear !");
}

#pragma mark - TB
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"BaseAssemblyComponent is select:%ld", (long)indexPath.row);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   return [UIView new];
}

/*
 * No-Used-Method
 */
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

-(BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return NO;
}


@end
