//
//  YYKitMacro.h
//  YYKit <https://github.com/ibireme/YYKit>
//
//  Created by ibireme on 13/3/29.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import <sys/time.h>
#import <pthread.h>

#ifndef YYKitMacro_h
#define YYKitMacro_h

#ifdef __cplusplus
#define YY_EXTERN_C_BEGIN  extern "C" {
#define YY_EXTERN_C_END  }
#else
#define YY_EXTERN_C_BEGIN
#define YY_EXTERN_C_END
#endif


YY_EXTERN_C_BEGIN





#ifndef YYSYNTH_DUMMY_CLASS
#define YYSYNTH_DUMMY_CLASS(_name_) \
@interface YYSYNTH_DUMMY_CLASS_ ## _name_ : NSObject @end \
@implementation YYSYNTH_DUMMY_CLASS_ ## _name_ @end
#endif




YY_EXTERN_C_END
#endif
