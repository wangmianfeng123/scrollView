//
//  FLHomeHeaderView.m
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

#import "FLHomeHeaderView.h"
#import "Masonry.h"
@implementation FLHomeHeaderView{
    
    NSArray *titleArr;
    CGFloat buttonW;
    
    UILabel *selectLabel;
}

static NSInteger buttonTag = 999;

-(void)addButtons:(NSArray *)titleArray buttonW:(CGFloat)w{
    
    titleArr = titleArray;
    buttonW = w;
    for (int i = 0; i < titleArray.count; i ++) {

        UIButton *button = [[UIButton alloc] init];
        [button setTag:buttonTag+i];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:(arc4random() % 256 ) / 255.0  green:(arc4random() % 256 ) / 255.0 blue:(arc4random() % 256 ) / 255.0 alpha:(arc4random() % 256 ) / 255.0 ]];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchDown];
        [self  addSubview:button];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(self).offset(0);
            make.left.equalTo(self).offset(i*buttonW);
            make.height.equalTo(self).offset(0);
            make.width.equalTo([NSNumber numberWithFloat:buttonW]);
            
            
        }];
        
    }
    
    
    selectLabel = [[UILabel alloc] init];
    [selectLabel setFrame:CGRectMake(0, 35, buttonW, 5)];
    [selectLabel setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:selectLabel];
    
}

- (void) titleClicked:(UIButton *)sender{
    NSLog(@"btn.tag:%ld",sender.tag);
    _page = sender.tag - buttonTag;
    
    if (sender.tag == 999) {
//        sender.titleLabel.textColor = [UIColor whiteColor];
//        [sender.titleLabel setTextColor:[UIColor whiteColor]];
        sender.backgroundColor = [UIColor whiteColor];

    }else{
//        sender.titleLabel.textColor = [UIColor whiteColor];
        [sender.titleLabel setTextColor:[UIColor whiteColor]];
    }
    
    if (self.linkageAction) {
        self.linkageAction(_page);
    }
    
    if (_page > 0 && _page < titleArr.count - 1) {
//        [self setContentOffset:CGPointMake((_page - 1) * buttonW,0) animated:YES];
        NSLog(@"ddddddd");
    }else if(_page == titleArr.count - 1){
//        [self setContentOffset:CGPointMake((_page - 2) * buttonW,0) animated:YES];
        NSLog(@"eeeeeeeee");
    }
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.5 animations:^{
//            [selectLabel setFrame:CGRectMake(_page*buttonW, 35, buttonW, 5)];
//        }];
//    });
    
    
}

- (void)setPage:(NSInteger)page{
    
    _page = page;
    if (_page > 1 && _page < titleArr.count - 1) {
//        [self setContentOffset:CGPointMake((_page - 1) * buttonW,0) animated:YES];
        NSLog(@"111111111");
    }else if(_page == 0){
        NSLog(@"22222222");
//        [self setContentOffset:CGPointMake(0,0) animated:YES];
    }
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.5 animations:^{
//            [selectLabel setFrame:CGRectMake(_page*buttonW, 35, buttonW, 5)];
//        }];
//    });
}

-(void)layoutSubviews{
    [super layoutSubviews];
}


@end
