//
//  yuanfangPicker.m
//  DMinutes
//
//  Created by MoMo on 2019/5/20.
//  Copyright © 2019 DM. All rights reserved.
//

#import "yuanfangPicker.h"

@implementation yuanfangPicker
{
    
    NSMutableArray *yearArray;
    NSMutableArray *monthArray;
    NSMutableArray *DaysArray;
    
    NSInteger year;
    NSInteger month;
    NSInteger day;
    
    
    NSString * yearstr;
    NSString * monthstr;
    NSString * daystr;
    
}



-(void)getYearMonthDay:(NSString*)dateString{
    
    NSDate * date = [TimeDatemater formaterYearAndMonthandDay:dateString];
    
    [self DaysfromYear:date.year andMonth:date.month ];
    
    [self.customPicker selectRow:[yearArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.year]] inComponent:0 animated:YES];
    
    [self.customPicker selectRow:[monthArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.month]] inComponent:1 animated:YES];
    
    [self.customPicker selectRow:[DaysArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.day]] inComponent:2 animated:YES];
    
    [self.customPicker reloadAllComponents];

    
    NSLog(@"year=%ld,month = %ld ,day = %ld",(long)date.year,(long)date.month,(long)date.day);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
    
-(instancetype)initWithFrame:(CGRect)frame withDate:(NSString *)dateString dateBlock:(DateBlock)dater
    {
        
        
        
    if (self = [super initWithFrame:frame]) {
            
 
        
    self.customPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    [self addSubview:self.customPicker];
    self.customPicker.delegate = self;
    self.customPicker.dataSource = self;
    NSDate *date = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];
    year =date.year;
    [formatter setDateFormat:@"MM"];
    NSString *currentMonthString = [NSString stringWithFormat:@"%ld",(long)[[formatter stringFromDate:date]integerValue]];
    month=date.month;
    [formatter setDateFormat:@"dd"];
    NSString *currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    day =date.day;
    
    yearArray = [[NSMutableArray alloc]init];
    for (int i = 1970; i <= year+10 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }
    
    
    monthArray =[NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    
    DaysArray = [[NSMutableArray alloc]init];
    
    
    if (dateString) {

        NSDate * date = [TimeDatemater formaterYearAndMonthandDay:dateString];

        [self DaysfromYear:date.year andMonth:date.month ];

        [self.customPicker selectRow:[yearArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.year]] inComponent:0 animated:YES];

        [self.customPicker selectRow:[monthArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.month]] inComponent:1 animated:YES];

        [self.customPicker selectRow:[DaysArray indexOfObject:[NSString stringWithFormat:@"%ld", (long)date.day]] inComponent:2 animated:YES];
        yearstr =  [NSString stringWithFormat:@"%ld",(long)date.year];
        
        monthstr = [NSString stringWithFormat:@"%ld",(long)date.month];
        
        daystr  = [NSString stringWithFormat:@"%ld",(long)date.day];
        
        dater(yearstr, monthstr, daystr);

    }else{
        [self DaysfromYear:year andMonth:month ];

        [self.customPicker selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];

        [self.customPicker selectRow:[monthArray indexOfObject:currentMonthString] inComponent:1 animated:YES];

        [self.customPicker selectRow:[DaysArray indexOfObject:currentDateString] inComponent:2 animated:YES];
   
        yearstr =  currentyearString;
        
        monthstr = currentMonthString;
        
        daystr  = currentDateString;
        
        dater(yearstr, monthstr, daystr);

    }


    
       }
        
        return self;
}



#pragma mark - UIPickerViewDelegate


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    
    
    if (component == 0)
    {
        
        yearstr = [yearArray objectAtIndex:row];
        
        year = [yearstr integerValue];
    }
    else if (component == 1)
    {
        
        monthstr = [monthArray objectAtIndex:row];
        month = [monthstr integerValue];
        
    }
    else if (component == 2)
    {
        
       daystr = [DaysArray objectAtIndex:row
                  ];
        day = [daystr integerValue];

    }
    
    [self DaysfromYear:year andMonth:month];
    [self.customPicker reloadAllComponents];

    self.dateBlock(yearstr, monthstr, daystr);
}


#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    // Custom View created for each component
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
    }
    
    
    
    if (component == 0)
    {
        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date
        
    }
    
    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 3;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        return [yearArray count];
        
    }
    else if (component == 1)
    {
        
        return [monthArray count];

    }
    else
    {
        
    
        return [self DaysfromYear:year andMonth:month];
    
    }
}



- (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month
{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:case 3:case 5:case 7:case 8:case 10:case 12:{
            [self setdayArray:31];
            return 31;
        }
        case 4:case 6:case 9:case 11:{
            [self setdayArray:30];
            return 30;
        }
        case 2:{
            if (isrunNian) {
                [self setdayArray:29];
                return 29;
            }else{
                [self setdayArray:28];
                return 28;
            }
        }
        default:
            break;
    }
    return 0;
}

- (void)setdayArray:(NSInteger)num
{
    [DaysArray removeAllObjects];
    for (int i=1; i<=num; i++) {
        [DaysArray addObject:[NSString stringWithFormat:@"%02d",i]];
    }
}





@end
