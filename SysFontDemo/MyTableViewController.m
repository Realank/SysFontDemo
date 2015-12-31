//
//  MyTableViewController.m
//  SysFontDemo
//
//  Created by Realank on 15/12/31.
//  Copyright © 2015年 Realank. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (nonatomic, strong) NSArray *fontFamilyArray;
@property (nonatomic, strong) NSMutableArray *fontArray;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fontFamilyArray = [UIFont familyNames];
    _fontArray = [NSMutableArray array];
    for (NSString* familyName in _fontFamilyArray) {
        NSArray *fontArray = [UIFont fontNamesForFamilyName:familyName];
        [_fontArray addObject:fontArray];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _fontArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* fontArr = [_fontArray objectAtIndex:section];
    return fontArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSString* fontName = [[_fontArray objectAtIndex:section] objectAtIndex:row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"系统字体展示ABCDefgh";
    cell.textLabel.font = [UIFont fontWithName:fontName size:15];
    NSString* fontFamilyName = [_fontFamilyArray objectAtIndex:section];
    fontFamilyName = [fontFamilyName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([fontFamilyName isEqualToString:@"Bodoni72Oldstyle"]) {
        fontFamilyName = @"BodoniSvtyTwoOSITCTT";
    }
    NSString* fontDetail = [fontName stringByReplacingOccurrencesOfString:fontFamilyName withString:@""];
    fontDetail = [fontDetail stringByReplacingOccurrencesOfString:@"-" withString:@""];
    cell.detailTextLabel.text = fontDetail;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_fontFamilyArray objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSString* fontName = [[_fontArray objectAtIndex:section] objectAtIndex:row];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"字体名称" message:fontName preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
