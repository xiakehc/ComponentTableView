//
//  SubDetailViewController.m
//  AssemblyTableview
//
//  Created by melody on 16/2/16.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "SubDetailViewController.h"
#import "UITitleNumberComponent.h"

@implementation SubDetailViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"Detail";
    self.view.backgroundColor = [UIColor whiteColor];
}

/*
 * 直接复用Component
 */
- (NSArray *)components{
    return [NSArray arrayWithObjects:
            @[@"UITitleNumberComponentKey", NSStringFromClass([UITitleNumberComponent class])] ,nil];
}


@end
