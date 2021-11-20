//
//  TimeDatemater.m
//  ss--dd
//
//  Created by MoMo on 2019/4/11.
//  Copyright © 2019 zds. All rights reserved.
//

#import "TimeDatemater.h"

@implementation TimeDatemater


+(NSString *)getNowTimeWithDommater{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
   // NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        
    [formatter setLocale:[NSLocale currentLocale]];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate *datenow = [NSDate date];
    
    NSString *currentDateStr = [formatter stringFromDate:datenow];
    
   // NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

    return currentDateStr;
    
}




+(NSDate*)getDatewithFormaterString:(NSString *)string{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate * date = [formatter dateFromString:string];
    
    return date;
}


+(NSDate*)getDatewithString:(NSString *)string{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSDate * date = [formatter dateFromString:string];
    
    return date;
}


+(NSString*)getStringwithdate:(NSDate *)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    [formatter setLocale:[NSLocale currentLocale]];
    
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    
    NSString * string = [formatter stringFromDate:date];
    
    return string;
}
+(NSString *)formaterYearAndMonthandDay{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString * str = [formatter stringFromDate:[NSDate date]];
    
    return str;
    
}



+(NSDate *)formaterYearAndMonthandDay:(NSString*)string{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate * date = [formatter dateFromString:string];
    
    return date;
    
}
@end
