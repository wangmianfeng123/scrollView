//
//  TimePickerView.m
//  SLRecord
//
//  Created by 张全新 on 2019/5/2.
//  Copyright © 2019 xqz. All rights reserved.
//

#import "TimePickerView.h"

@implementation TimePickerView


- (void)drawRect:(CGRect)rect {
    
   

   
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self= [super initWithFrame:frame]) {

        self.sxArr =@[@"上午",@"下午"];
        self.hourArr =@[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",];
        self.minuteArr = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59"];
        
        
        self.sx =@"上午";
        self.hour =@"01";
        self.minute =@"00";
        
        
        self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        }];
        
        _toolsView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 244, kScreenWidth, 44)];
        _toolsView.backgroundColor = kRGBColor(248, 248, 248);
        [self addSubview:_toolsView];
        
        // 右边确定按钮
        UIButton *rightSureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        rightSureBtn.frame = CGRectMake(kScreenWidth - 54, 0, 44, 44);
        [rightSureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [rightSureBtn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [rightSureBtn setTitleColor:kRGBAColor(16, 16, 16, 1) forState:UIControlStateNormal];
        [_toolsView addSubview:rightSureBtn];
        
        // 中间显示  label
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, kScreenWidth - 108, 44)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"选择时间";
        titleLabel.font = [UIFont systemFontOfSize:13];
        [_toolsView addSubview:titleLabel];
        
        
        // 左边取消按钮
        UIButton *leftCancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
        leftCancleButton.frame = CGRectMake(10, 0, 44, 44);
        [leftCancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [leftCancleButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [leftCancleButton setTitleColor:kRGBAColor(16, 16, 16, 1) forState:UIControlStateNormal];
        [_toolsView addSubview:leftCancleButton];
        
        
        
        _picerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 200, kScreenWidth, 200)];
        _picerView.dataSource = self;
        _picerView.delegate = self;
        
        [_picerView selectRow:0 inComponent:0 animated:YES];
        
        [_picerView selectRow:0 inComponent:1 animated:YES];
        
        [_picerView selectRow:0 inComponent:2 animated:YES];
        
        _picerView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_picerView];
        


    }
    
    
    
    return self;
}



- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    
    return 3;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component ==0 ) {
        return 2;
    }else if (component==1){
        
        return 12;
    }else{
        return 60;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component ==0) {
        return self.sxArr [row];
    }else if (component ==1){
        
        return self.hourArr [row];
    }else{
        
        return self.minuteArr[row];
    }
    
    
    
}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    
    if (component ==0) {
        
        self.sx= self.sxArr [row];
        
    }else if (component ==1){
        
    
        
        self.hour= self.hourArr [row];
        
        
        
    }else{
        
        
        self.minute= self.minuteArr[row];
    }
    
    
}






- (void)rightButtonClick:(UIButton *)button
{
    
    
    
    if ([self.sx isEqualToString:@"上午"]) {
        
        self.clockblock(self.sx, self.hour, self.minute);

    }else if([self.sx isEqualToString:@"下午"]) {
        self.hour =[NSString stringWithFormat:@"%ld", [self.hour integerValue]+12];
        
        self.clockblock(self.sx, self.hour, self.minute);

    }
    
    
    
    [self thisWayIsDissmisssSelf];
}


- (void)leftButtonClick:(UIButton *)button
{
    [self thisWayIsDissmisssSelf];
}

#pragma mark -
#pragma mark - 屏幕点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self thisWayIsDissmisssSelf];
}


#pragma mark -
#pragma mark - 消失的方法
- (void)thisWayIsDissmisssSelf
{
    __weak typeof (self)weakSelf = self;
    __weak typeof(UIView *)blockView = _toolsView;
    __weak typeof(UIPickerView *)blockPickerViwe = _picerView;
    [UIView animateWithDuration:0.3 animations:^{
        blockView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 44);
        blockPickerViwe.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 200);
    }completion:^(BOOL finished) {
        
        [blockView removeFromSuperview];
        [blockPickerViwe removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}

@end
