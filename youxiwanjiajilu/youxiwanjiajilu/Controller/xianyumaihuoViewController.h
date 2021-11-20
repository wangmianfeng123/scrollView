//
//  xianyumaihuoViewController.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^Players)(NSMutableArray * players);

@interface xianyumaihuoViewController : UIViewController

@property (nonatomic , strong) Texas * texas;

@property (nonatomic , strong) Players players;

@end

NS_ASSUME_NONNULL_END
