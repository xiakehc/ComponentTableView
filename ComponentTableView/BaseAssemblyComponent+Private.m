//
//  BaseAssemblyComponent+Private.m
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "BaseAssemblyComponent+Private.h"
#import <objc/runtime.h>

static const char *keyForTableView = "keyForTableView";
static const char *keyForDataDicitionary = "keyForDataDictionary";
static const char *keyForComponentSection = "keyForComponentSection";
static const char *keyForComponentType = "keyForComponentType";

@implementation BaseAssemblyComponent (Private)
@dynamic tableView;

- (void)setTableView:(BaseAssemblyTableView *)tableView
{
    objc_setAssociatedObject(self, keyForTableView, tableView, OBJC_ASSOCIATION_RETAIN);
}

- (BaseAssemblyTableView *)tableView
{
    return objc_getAssociatedObject(self, keyForTableView);
}

- (void)setDataDictionary:(NSDictionary *)dataDictionary{
    objc_setAssociatedObject(self, keyForDataDicitionary, dataDictionary, OBJC_ASSOCIATION_RETAIN);
}

- (NSDictionary *)dataDictionary{
    return objc_getAssociatedObject(self, keyForDataDicitionary);
}

- (void)setComponentSections:(NSArray *)componentSections{
    objc_setAssociatedObject(self, keyForComponentSection, componentSections, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray *)componentSections{
    return objc_getAssociatedObject(self, keyForComponentSection);
}

- (void)setComponentType:(NSString *)componentType{
    objc_setAssociatedObject(self, keyForComponentType, componentType, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)componentType{
    return objc_getAssociatedObject(self, keyForComponentType);
}


@end
