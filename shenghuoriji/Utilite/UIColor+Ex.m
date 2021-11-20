//
//  UIColor+Ex.m
//  HMContact
//
//  Created by hyq he on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIColor+Ex.h"

#pragma mark NSString+Hex
@interface NSString (Hex)
{
    
}
- (NSUInteger)integerValueFromHex;
@end


@implementation NSString (Hex)
- (NSUInteger)integerValueFromHex 
{
	NSUInteger result = 0;
	sscanf([self UTF8String], "%x", &result);
	return result;
}
@end

#pragma mark UIColor+EX
@implementation UIColor (Ex)
+ (UIColor *)colorWithHexString:(NSString *)hex 
{
	if ([hex length] != 6 && [hex length] != 3) {
		return nil;   
	}
	
	NSUInteger digits = [hex length] / 3;
	CGFloat maxValue = (digits == 1) ? 15.0 : 255.0;
	
	CGFloat red = [[hex substringWithRange:NSMakeRange(0, digits)] integerValueFromHex] / maxValue;
	CGFloat green = [[hex substringWithRange:NSMakeRange(digits, digits)] integerValueFromHex] / maxValue;
	CGFloat blue = [[hex substringWithRange:NSMakeRange(2 * digits, digits)] integerValueFromHex] / maxValue;
	
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha
{
	if ([hex length] != 6 && [hex length] != 3) {
		return nil;
	}
	
	NSUInteger digits = [hex length] / 3;
	CGFloat maxValue = (digits == 1) ? 15.0 : 255.0;
	
	CGFloat red = [[hex substringWithRange:NSMakeRange(0, digits)] integerValueFromHex] / maxValue;
	CGFloat green = [[hex substringWithRange:NSMakeRange(digits, digits)] integerValueFromHex] / maxValue;
	CGFloat blue = [[hex substringWithRange:NSMakeRange(2 * digits, digits)] integerValueFromHex] / maxValue;
	
	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)randomColor:(NSArray *)colorArray
{
    NSInteger index = arc4random() % colorArray.count;
    
    if (index < 0 && index >= colorArray.count)
    {
        
        index = 0;
        
    }
    
    return [UIColor colorWithHexString:[colorArray objectAtIndex:index]];
}

@end
