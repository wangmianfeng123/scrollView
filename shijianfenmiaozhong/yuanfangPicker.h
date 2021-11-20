//
//  yuanfangPicker.h
//  DMinutes
//
//  Created by MoMo on 2019/5/20.
//  Copyright © 2019 DM. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DateBlock)(NSString* year , NSString* month, NSString* day);

@interface yuanfangPicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong)UIPickerView *customPicker;

@property (nonatomic,strong)DateBlock dateBlock;

-(instancetype)initWithFrame:(CGRect)frame withDate:(nullable NSString*)dateString dateBlock:(DateBlock)dater;
    
@end

NS_ASSUME_NONNULL_END
