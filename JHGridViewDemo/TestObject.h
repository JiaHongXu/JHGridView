//
//  TestObject.h
//  JHSingleTitleGridView
//
//  Created by 307A on 16/9/26.
//  Copyright © 2016年 Jiahong Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *sex;
@property (nonatomic) NSString *number;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *birthday;

- (instancetype)initWithName:(NSString *)name Sex:(NSString *)sex Number:(NSString *)number Address:(NSString *)address Birthday:(NSString *)birthday;
@end
