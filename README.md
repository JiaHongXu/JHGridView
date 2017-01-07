# JHGridView
一个iOS上的可高度自定义的GridView

####截图
![GridView实现截图（课程表）](http://upload-images.jianshu.io/upload_images/2310484-7d3c9cda212d9a0a.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/800)
####定义的枚举类型和结构体
```
//use for representing the location in gridview
typedef struct GridIndex {
    long row;
    long col;
} GridIndex;

//use for specifing the selection type
typedef enum{
    JHGridSelectTypeNone,       //default, none selection can be seen
    JHGridSelectTypeDefault,    //when click on an item, the whole line will be selected also
    JHGridSelectTypeSingle,     //only select the clicked item
}JHGridSelectType;

//use for specifing the alignment type
typedef enum{
    JHGridAlignmentTypeDefault, //center alignment
    JHGridAlignmentTypeLeft,    //left alignment
    JHGridAlignmentTypeRight,   //right alignment
}JHGridAlignmentType;
```
分别是用于表示位置坐标的`GridIndex`（类似`NSIndexPath`），用于表示选择样式的`JHGridSelectType`和用于表示对齐方式的`JHGridAlignmentType`
####可实现的代理方法
```
@protocol JHGridViewDelegate<NSObject>

@optional
- (CGFloat)heightForRowAtIndex:(long)index;
@optional
- (CGFloat)widthForColAtIndex:(long)index;
@optional
- (CGFloat)heightForTitles;
@optional
- (BOOL)isTitleFixed;
@optional
- (void)didSelectRowAtGridIndex:(GridIndex)gridIndex;
@optional
- (JHGridSelectType)gridViewSelectType;
@optional
- (JHGridAlignmentType)gridViewAlignmentType;
@optional
- (UIColor *)backgroundColorForTitleAtIndex:(long)index;
@optional
- (UIColor *)backgroundColorForGridAtGridIndex:(GridIndex)gridIndex;
@optional
- (UIColor *)textColorForTitleAtIndex:(long)index;
@optional
- (UIColor *)textColorForGridAtGridIndex:(GridIndex)gridIndex;
@optional
- (UIFont *)fontForTitleAtIndex:(long)index;
@optional
- (UIFont *)fontForGridAtGridIndex:(GridIndex)gridIndex;
@end
```
其中比较常用的有
```
- (void)didSelectRowAtGridIndex:(GridIndex)gridIndex;
```
用于处理表格元素被选中的事件
```
- (BOOL)isTitleFixed;
```
用于表示标题栏是否固定，默认为`NO`

####`JHGridView`的方法
```
//init methods
- (instancetype)initWithFrame:(CGRect)frame;

//call this methods to load the gridview
- (void)setTitles:(NSArray<NSString *> *)titles andObjects:(NSArray *)objects withTags:(NSArray<NSString *> *)tags;
```
第二个方法在需要显示数据的时候调用，传入一个标题（表头行）的`NSString`数组，一堆需要显示用的数据的`model`数组，以及每一列对应`model`中属性名称的`NSString`数组（用于`KVC`赋值）

###使用Demo
使用该控件时把`JHGridView`目录拖入工程
如果不需要指定颜色、字体大小、行高列宽以及处理选中事件的可以不实现代理方法
```
#import "JHGridView.h"
@interface ViewController ()<JHGridViewDelegate>
```
初始化并赋值
```
JHGridView *gridView = [[JHGridView alloc] initWithFrame:
                        CGRectMake(0, 64, self.view.frame.size.width, 300)];
gridView.delegate = self;
NSArray *array = @[
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-01"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-02"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-03"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-04"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-05"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-06"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-07"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-08"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-09"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-10"],
                   [[TestObject alloc] initWithName:@"aaa" Sex:@"11" Number:@"ooo" Address:@"sdfabfsakjbakf" Birthday:@"1996-01-11"]];
[gridView setTitles:@[@"NAME",
                      @"SEX",
                      @"PHONE",
                      @"ADDRESS",
                      @"BIRTHDAY"]
         andObjects:array withTags:@[@"name",@"sex",@"number",@"address",@"birthday"]];
[self.view addSubview:gridView];
```
如果需要自定义，则实现代理方法
```
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

- (UIFont *)fontForTitleAtIndex:(long)index{
    return [UIFont systemFontOfSize:20];
}
```
####运行效果
![Demo运行截图](http://upload-images.jianshu.io/upload_images/2310484-beaa64c8693f2864.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/400)
