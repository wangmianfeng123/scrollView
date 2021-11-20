//
//  TimeDatemater.h
//  ss--dd
//
//  Created by MoMo on 2019/4/11.
//  Copyright © 2019 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimeDatemater : NSObject

+(NSString *)getNowTimeWithDommater;
+(NSDate*)getDatewithFormaterString:(NSString *)string;



+(NSDate*)getDatewithString:(NSString *)string;
+(NSString*)getStringwithdate:(NSDate *)date;


+(NSString *)formaterYearAndMonthandDay;
+(NSDate *)formaterYearAndMonthandDay:(NSString*)string;

@end

NS_ASSUME_NONNULL_END
