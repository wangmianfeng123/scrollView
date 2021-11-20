//
//  zhuandaqianTianYaClassificationManagementModel.m
//  TianYa
//
//  Created by 程本德 on 2019/3/13.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaClassificationManagementModel.h"

@implementation zhuandaqianTianYaClassificationManagementModel
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        self.img_name = [aDecoder decodeObjectForKey:@"img_name"];
        self.classificationManagement_name = [aDecoder decodeObjectForKey:@"classificationManagement_name"];
        self.isSelete = [aDecoder decodeObjectForKey:@"isSelete"];

    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.img_name forKey:@"img_name"];
    [aCoder encodeObject:self.classificationManagement_name forKey:@"classificationManagement_name"];
    [aCoder encodeObject:self.isSelete forKey:@"isSelete"];

}
@end
