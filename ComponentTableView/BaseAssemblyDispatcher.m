//
//  BaseAssemblyTableViewController.m
//  AssemblyTableview
//
//  Created by melody on 16/2/15.
//  Copyright © 2016年 yuking. All rights reserved.
//

#import "BaseAssemblyDispatcher.h"
#import "BaseAssemblySectionModel.h"
#import "BaseAssemblyComponent+Private.h"

@interface BaseAssemblyDispatcher ()
@property (nonatomic,strong) NSMutableDictionary *assemblyComponents;

@end

@implementation BaseAssemblyDispatcher
@synthesize tableView,dataDictionary;

- (instancetype)init
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        [self initWithData];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self initWithData];
    }
    return self;
}

- (void)initWithData
{ 
    self.assemblyComponents = [NSMutableDictionary dictionary];
}

- (void)loadView
{
    CGRect rect = [UIScreen mainScreen ].bounds;
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView  = [[BaseAssemblyTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.baseDelegate = self;
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self initWithData];
    [self updateSections];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (BaseAssemblySectionModel *section in self.assemblyComponents.allValues) {
        [section.component assemblyComponentWillAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (BaseAssemblySectionModel *section in self.assemblyComponents.allValues) {
        [section.component assemblyComponentWillDisappear:animated];
    }
}

#pragma mark - work
- (NSArray *)components{
    return @[];
}

#pragma mark - BaseAssemblyTableViewDelegate

- (void)tableViewWillReloadData:(BaseAssemblyTableView *)tableView
{
    [self updateSections];
}

- (void)updateSections
{
    __block BaseAssemblyDispatcher *_wself = self;
    NSArray *list = [self components];
    [self clearRepeatComponentKey:list];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *arr = ((NSArray*)obj);
        if (!arr || arr.count<1)
            return ;
        BaseAssemblySectionModel *section = [BaseAssemblySectionModel new];
        section.sectionIndexInTableView = idx;

        NSString *ComponentType = arr.firstObject;
        Class ComponentClass = NSClassFromString(arr[1]);
        BaseAssemblyComponent *Component = _wself.assemblyComponents[@(idx).stringValue];
        if (!Component || ![Component isKindOfClass:ComponentClass]) {
            Component = [self createComponentWithComponentClass:ComponentClass ComponentType:ComponentType];
        }
        section.component = Component;
        section.componentKey = ComponentType;
        [_wself.assemblyComponents setValue:section forKey:@(idx).stringValue];
    }];
}

- (BaseAssemblyComponent *)createComponentWithComponentClass:(Class)ComponentClass ComponentType:(NSString *)componentType
{
    if ([ComponentClass isSubclassOfClass:[BaseAssemblyComponent class]]) {
        BaseAssemblyComponent *Component = [ComponentClass new];
        Component.tableView = self.tableView;
        Component.dataDictionary = self.dataDictionary;
        Component.componentType = componentType;
        Component.componentSections = [self components];
        [self addChildViewController:Component];
        [Component setupComponent];
        
        return Component;
    }
    else {
        return [BaseAssemblyComponent new];
    }
}

- (void)clearRepeatComponentKey:(NSArray*)list
{
    __block BaseAssemblyDispatcher *_wself = self;
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *arr = ((NSArray*)obj);
        if (!arr || arr.count<1)
            return ;
        NSString *ComponentType = arr.firstObject;
        NSArray *values = _wself.assemblyComponents.allValues;
        NSInteger isRepeate = [_wself isRepeat:values withType:ComponentType];
        if(isRepeate>-1){
            BaseAssemblySectionModel *section = [self.assemblyComponents objectForKey:@(isRepeate).stringValue];
            [section.component removeFromParentViewController];
            [_wself.assemblyComponents removeObjectForKey:@(isRepeate).stringValue];
        }
    }];
}

- (NSInteger)isRepeat:(NSArray *)values withType:(NSString*)ComponentType{
    __block NSInteger isRepeate = -1;
    [values enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BaseAssemblySectionModel *section = (BaseAssemblySectionModel*)obj;
        if([section.componentKey isEqualToString:ComponentType]){
            isRepeate = section.sectionIndexInTableView;
            *stop = YES;
        }
    }];
    return isRepeate;
}

#pragma mark - TB

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray *arr = self.assemblyComponents.allKeys;
    return arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString * idx = @(section).stringValue;
    BaseAssemblySectionModel *sectionComponent = [self.assemblyComponents valueForKey:idx];
    return [sectionComponent.component tableView:self.tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel  *sectionComponent = [self.assemblyComponents valueForKey:idx];
    [sectionComponent.component view];
    return [sectionComponent.component tableView:self.tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    [sectioncomponent.component tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSString * idx = @(section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView heightForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    NSString * idx = @(section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView heightForFooterInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString * idx = @(section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView viewForHeaderInSection:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSString * idx = @(section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView viewForFooterInSection:section];
}

/*
 * No used
 */
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    [sectioncomponent.component tableView:self.tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView canEditRowAtIndexPath:indexPath];
}

-(BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView canFocusRowAtIndexPath:indexPath];
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * idx = @(indexPath.section).stringValue;
    BaseAssemblySectionModel *sectioncomponent = [self.assemblyComponents valueForKey:idx];
    return [sectioncomponent.component tableView:self.tableView canMoveRowAtIndexPath:indexPath];
}

@end
