//
//  Dispatchqueuetime.m
//  BaseC
//
//  Created by 张全新 on 2019/4/20.
//  Copyright © 2019 zds. All rights reserved.
//

#import "Dispatchqueuetime.h"

@implementation Dispatchqueuetime




+(void)dispatchwithtime:(int)time_out
              timeBlock:(TimeBlock)timeBlock{
    __block int timeout=time_out; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
     dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    //开始的时间
   // dispatch_time_t startTime = dispatch_walltime(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);
    
    dispatch_time_t startTime = dispatch_walltime(NULL,0);
    //间隔的时间
    uint64_t interval = 1.0 * NSEC_PER_SEC;
    
    dispatch_source_set_timer(_timer,startTime,interval, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                timeBlock(0, 0 ,_timer);

            });
        }else{
//            int minutes;
//            int scends;
//
//            if (timeout>60) {
//                 minutes = timeout / 60;
//                 scends = timeout%60;
//            }else{
//
//                scends = timeout % 60;
//            }
            
            
            
            int minutes = timeout / 60;
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
               timeBlock(minutes, seconds ,_timer);
                
            });
            timeout--;
        }
    });
    //启动定时器
    dispatch_resume(_timer);
    
}

@end
