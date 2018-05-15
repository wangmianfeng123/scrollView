//
//  FLLinkageView.m
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

//联动分为两部分，上面的一条分栏；下面一个可以滑动的内容部分
//两部分均可采用UICollectionView来实现；也能通过UIScrollView来实现；
//该例子中上边分栏采用UIScrollView实现；下边内容用UICollectionView来实现
#import "FLLinkageView.h"
#import "FLHomeBodyView.h"
#import "FLHomeHeaderView.h"
#import "Masonry.h"
@implementation FLLinkageView{
    FLHomeHeaderView *homeHeader;
    FLHomeBodyView *homeBody;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        // 添加子控件
        [self initUI];
        
        //设置header和body一起联动
        
        [self addLinkageAction];
    }
    return self;
}

- (void)initUI{
    
    
    NSLog(@"=====%@",NSStringFromCGRect(self.frame));
    NSArray *titlesArray = @[@"标题0" ,@"标题1"];
    homeHeader = [[FLHomeHeaderView alloc] init];
    [homeHeader setContentSize:CGSizeMake(titlesArray.count * 100, 40)];
    [homeHeader setShowsHorizontalScrollIndicator:NO];
      [homeHeader addButtons:titlesArray buttonW:[UIScreen mainScreen].bounds.size.width / 2];
    [homeHeader setBackgroundColor:[UIColor lightGrayColor]];
    [self addSubview:homeHeader];
    
  
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout .minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49 - 40);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    homeBody = [[FLHomeBodyView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    homeBody.pagingEnabled = YES;
    homeBody.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [homeBody setTitleArray:titlesArray];
    [self addSubview:homeBody];
    
    [self setBackgroundColor:[UIColor whiteColor]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [homeHeader mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.top.equalTo(self).offset(20+44);
        make.height.equalTo(@40);
    }];
    
    [homeBody mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(104);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@(self.frame.size.height - 64 - 49 - 40));
    }];
    
    
}


- (void) addLinkageAction{

    __weak typeof(homeHeader) weakHomeHeader = homeHeader;
    homeBody.linkageAction = ^(NSInteger page) {
        weakHomeHeader.page = page;
    };
    
    __weak typeof(homeBody) weakHomeBody = homeBody;
    homeHeader.linkageAction = ^(NSInteger page) {
        weakHomeBody.page = page;
    };

    
}

@end
