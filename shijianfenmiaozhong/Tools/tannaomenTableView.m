//
//  tannaomenTableView.m
//  MDHelper
//
//  Created by MoMo on 2019/5/8.
//  Copyright © 2019 xqz. All rights reserved.
//

#import "tannaomenTableView.h"
@interface tannaomenTableView (){
    
    QMUIEmptyView *_emptyViewV;
}

@end
@implementation tannaomenTableView


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        _emptyViewV =[[QMUIEmptyView alloc]initWithFrame:CGRectMake((kScreenWidth-self.frame.size.width)/2, 0, self.frame.size.width, self.frame.size.height)];
        
        [_emptyViewV setBackgroundColor:[UIColor clearColor]];
        
        [_emptyViewV setTextLabelTextColor:kRGBAColor(255, 255, 255, 0.5)];
        
        [_emptyViewV setTextLabelText:@"无添加记录"];
        
        [_emptyViewV setLoadingViewHidden:YES];
        
        [self addSubview:_emptyViewV];
        
        _emptyViewV.hidden =YES;

        
    }
    
    return self;
}


-(void)showEmptyView{
    
    _emptyViewV.hidden =NO;

    
}

-(void)hiddenEmptyView{
    
    
    _emptyViewV.hidden =YES;
}


@end
