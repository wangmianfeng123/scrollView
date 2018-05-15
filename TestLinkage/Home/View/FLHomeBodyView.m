//
//  FLHomeBodyView.m
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

#import "FLHomeBodyView.h"
#import "FLHomeBodyViewCell.h"
@implementation FLHomeBodyView

static NSString * ID = @"FLHomeBodyViewCellID";
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[FLHomeBodyViewCell class] forCellWithReuseIdentifier:ID];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

#pragma mark ------------------------ uicollection delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FLHomeBodyViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 100, 100, 50);
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor grayColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(105, 100, 50, 50);
    btn.backgroundColor = [UIColor whiteColor];
    if (indexPath.item == 0) {
        label.text = @"登录页面";
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:btn];
    }else if(indexPath.item == 1){
        label.text = @"注册页面";
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:btn];
    }
    cell.classID = [NSString stringWithFormat:@"%@",self.titleArray[indexPath.item]];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random() % 256 ) / 255.0  green:(arc4random() % 256 ) / 255.0 blue:(arc4random() % 256 ) / 255.0 alpha:(arc4random() % 256 ) / 255.0 ];
    return cell;
}


- (void)btnAction:(UIButton *)btn{
    NSLog(@"1111111111111");
}


- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSLog(@"====当前是第 %lf 页面 ===", targetContentOffset->x / [UIScreen mainScreen].bounds.size.width);
    
    NSInteger page = targetContentOffset->x / [UIScreen mainScreen].bounds.size.width;
    
    if (self.linkageAction) {
        self.linkageAction(page);
    }
}

- (void)setPage:(NSInteger)page{
    
    _page = page;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:page inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
    });
}

@end
