//
//  TimePickerView.h
//  SLRecord
//
//  Created by 张全新 on 2019/5/2.
//  Copyright © 2019 xqz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClockBlock)(NSString*sx,NSString *hour,NSString *minute);

@interface TimePickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong)UIView *toolsView;
@property (nonatomic ,strong)UIPickerView *picerView;

@property (nonatomic ,strong)ClockBlock clockblock;

@property (nonatomic ,strong)NSArray *sxArr;
@property (nonatomic ,strong)NSArray *hourArr;
@property (nonatomic ,strong)NSArray *minuteArr;

@property (nonatomic ,strong)NSString *sx;
@property (nonatomic ,strong)NSString *hour;
@property (nonatomic ,strong)NSString *minute;


@end

NS_ASSUME_NONNULL_END
