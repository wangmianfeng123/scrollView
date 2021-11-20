//
//  xiyiyeViewController.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface xiyiyeViewController : UIViewController

@property (nonatomic ,strong) Texas * texas;

@property (weak, nonatomic) IBOutlet UILabel *potAmount;

@property (weak, nonatomic) IBOutlet UILabel *BlindsAmount;

@property (weak, nonatomic) IBOutlet UILabel *initialAmount;

@end

NS_ASSUME_NONNULL_END
