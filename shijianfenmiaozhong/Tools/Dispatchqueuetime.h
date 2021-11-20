//
//  Dispatchqueuetime.h
//  BaseC
//
//  Created by 张全新 on 2019/4/20.
//  Copyright © 2019 zds. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TimeBlock)(int minutes,int scends ,dispatch_source_t timer);

@interface Dispatchqueuetime : NSObject

+(void)dispatchwithtime:(int)time_out
              timeBlock:(TimeBlock)timeBlock;


@end

NS_ASSUME_NONNULL_END
