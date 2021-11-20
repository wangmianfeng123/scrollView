//
//  Record.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/30.
//  Copyright © 2019 paien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGFMDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface Record : NSObject


@property (nonatomic, assign)int bet;

@property (nonatomic, strong)NSString *time;

@property (nonatomic, strong)NSString *name;

@property (nonatomic, strong)NSNumber * texas;

@property (nonatomic, assign)int current;


@end

NS_ASSUME_NONNULL_END
