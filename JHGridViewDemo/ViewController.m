//
//  ViewController.m
//  JHGridViewDemo
//
//  Created by 307A on 2016/10/14.
//  Copyright © 2016年 Jiahong Xu. All rights reserved.
//

#import "ViewController.h"
#import "JHGridView.h"
#import "TestObject.h"

@interface ViewController ()<JHGridViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    JHGridView *gridView = [[JHGridView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 300)];
    gridView.delegate = self;
    NSArray *array = @[[[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"],
                       [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-06-14"]];
    [gridView setTitles:@[@"姓名",
                          @"性别",
                          @"电话号码",
                          @"地址",
                          @"生日"]
             andObjects:array withTags:@[@"name",@"sex",@"number",@"address",@"birthday"]];
    [self.view addSubview:gridView];
}

- (void)didSelectRowAtGridIndex:(GridIndex)gridIndex{
    NSLog(@"selected at\ncol:%ld -- row:%ld", gridIndex.col, gridIndex.row);
}

- (BOOL)isTitleFixed{
    return YES;
}

- (CGFloat)widthForColAtIndex:(long)index{
    if (index==3||index==4) {
        return 120;
    }else{
        return 90;
    }
}

- (UIColor *)backgroundColorForTitleAtIndex:(long)index{
    return [UIColor colorWithRed:229/255.0 green:114/255.0 blue:30/255.0 alpha:1];
}

- (UIColor *)backgroundColorForGridAtGridIndex:(GridIndex)gridIndex{
    if (gridIndex.row == 2) {
        return [UIColor cyanColor];
    }else if (gridIndex.col == 4){
        return [UIColor yellowColor];
    }else{
        return [UIColor whiteColor];
    }
}

- (UIColor *)textColorForTitleAtIndex:(long)index{
    if (index==1) {
        return [UIColor whiteColor];
    }else{
        return [UIColor blackColor];
    }
}

- (UIColor *)textColorForGridAtGridIndex:(GridIndex)gridIndex{
    if (gridIndex.col == 1) {
        return [UIColor blueColor];
    }else{
        return [UIColor blackColor];
    }
}

@end
