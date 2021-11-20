//
//  bingtangxueliView.h
//  DMinutes
//
//  Created by MoMo on 2019/5/20.
//  Copyright © 2019 DM. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^CatoryBlock)(NSString* _Nullable CatoryName);
NS_ASSUME_NONNULL_BEGIN

@interface bingtangxueliView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView * CatoryTableview;


@property (nonatomic,strong)NSIndexPath * indexPath;


@property (nonatomic,strong)NSArray * array;

@property (nonatomic,strong)CatoryBlock catoryBlock;

@property (nonatomic,strong)NSString * catory_name;

-(void)selectCatoryIndexPathWithName:(NSString*)name withBlock:(CatoryBlock) catoryBlock;


@end

NS_ASSUME_NONNULL_END
