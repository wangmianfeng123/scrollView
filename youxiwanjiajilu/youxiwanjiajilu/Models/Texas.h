//
//  Texas.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/25.
//  Copyright © 2019 paien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGFMDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface Texas : NSObject<YYModel>

@property (nonatomic, strong)NSString *title;

@property (nonatomic, strong)NSData *photoData;

@property (nonatomic, strong)NSString *date;

@property (nonatomic, strong)NSString *status;

@property (nonatomic, assign)int score;

@property (nonatomic, assign)int bet;

@property (nonatomic, assign)long pot;

@property (nonatomic, strong)NSMutableArray  * Players;


@end

NS_ASSUME_NONNULL_END
