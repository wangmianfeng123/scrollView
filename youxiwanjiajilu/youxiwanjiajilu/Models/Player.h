//
//  Player.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/25.
//  Copyright © 2019 paien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGFMDB.h"
NS_ASSUME_NONNULL_BEGIN

@class Texas;

@interface Player : NSObject<YYModel>


@property (nonatomic, strong)NSString *name;


@property (nonatomic, strong)NSData *photoData;


@property (nonatomic, assign)int Amount;


@property (nonatomic, assign)int betamount;


@property (nonatomic, strong)Texas *texas;


@end

NS_ASSUME_NONNULL_END
