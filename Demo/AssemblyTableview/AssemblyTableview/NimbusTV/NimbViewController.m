//
//  NimbViewController.m
//  AssemblyTableview
//
//  Created by melody on 16/2/18.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "NimbViewController.h"
#import "NimbusModels.h"
#import "CustomTextCell.h"

@interface NimbViewController()
@property (nonatomic, retain) NITableViewModel* model;

@end

@implementation NimbViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        NSArray *tableContents = @[
                                   @"111",
                                   [CustomTextCellObject objectWithTitle:@"Title 1"],
                                   [CustomTextCellObject objectWithTitle:@"Title 2"]
                                   ];
        self.model = [[NITableViewModel alloc] initWithSectionedArray:tableContents
                                                             delegate:(id)[NICellFactory class]];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"NimbusTV";
    self.tableView.dataSource = self.model;
    self.tableView.delegate = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NICellFactory tableView:tableView heightForRowAtIndexPath:indexPath model:self.model];
}

@end
