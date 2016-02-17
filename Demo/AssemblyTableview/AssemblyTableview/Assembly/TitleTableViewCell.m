//
//  TitleCell.m
//  AssemblyTableview
//
//  Created by melody on 16/2/16.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "TitleTableViewCell.h"

@interface TitleTableViewCell()
@property (nonatomic,strong) UILabel *textlbl;

@end

@implementation TitleTableViewCell
@synthesize textLabel;

- (void)updateData:(id)model{
    [self initSubViews];
    if ([[model class] isSubclassOfClass:[NSString class]]) {
        self.textlbl.text = (NSString*)model;
    }
}

- (void)initSubViews{
    if(!self.textlbl){
        self.textlbl = [UILabel new];
        self.textlbl.textColor = [UIColor blackColor];
        self.textlbl.font = [UIFont systemFontOfSize:18.0];
        [self.contentView addSubview:self.textlbl];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.textlbl.frame = CGRectMake(15, 0, self.contentView.frame.size.width-15, self.contentView.frame.size.height);
}
@end
