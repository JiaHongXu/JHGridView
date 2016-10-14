//
//  TestObject.m
//  JHSingleTitleGridView
//
//  Created by 307A on 16/9/26.
//  Copyright © 2016年 Jiahong Xu. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (instancetype)initWithName:(NSString *)name Sex:(NSString *)sex Number:(NSString *)number Address:(NSString *)address Birthday:(NSString *)birthday{
    if (self = [super init]) {
        _name = name;
        _sex = sex;
        _number = number;
        _address = address;
        _birthday = birthday;
    }
    
    return self;
}
@end
