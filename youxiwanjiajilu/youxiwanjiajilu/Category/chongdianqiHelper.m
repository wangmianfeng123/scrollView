//
//  chongdianqiHelper.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/30.
//  Copyright © 2019 paien. All rights reserved.
//

#import "chongdianqiHelper.h"

@implementation chongdianqiHelper


+(NSString *)dateFormatterAMAndPM{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"hh:mm a"];
    
    formatter.AMSymbol = @"AM";
                          
    formatter.PMSymbol = @"PM";
    
    NSString *time =[formatter stringFromDate:[NSDate date]];
    
    return time;
    
}
+(NSString *)getTimeFormatterWithDate:(NSDate*)date{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm a"];
    
    formatter.AMSymbol = @"AM";
    
    formatter.PMSymbol = @"PM";
    
    NSString *time =[formatter stringFromDate:date];
    
    return time;
    
}




@end
