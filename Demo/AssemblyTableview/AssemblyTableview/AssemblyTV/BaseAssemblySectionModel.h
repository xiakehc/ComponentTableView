//
//  BaseAssemblySection.h
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAssemblyComponent.h"

@interface BaseAssemblySectionModel : NSObject
@property (assign, nonatomic) NSUInteger sectionIndexInTableView;
@property (strong, nonatomic) BaseAssemblyComponent *component;
@property (strong, nonatomic) NSString *componentKey;

@end
