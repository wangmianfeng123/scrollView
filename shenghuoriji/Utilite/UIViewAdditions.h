//
//  UIViewAdditions.h
//  HMContacts
//
//  Created by hyq he on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CTAdditions)

@property(nonatomic, assign) CGFloat left;
@property(nonatomic, assign) CGFloat right;
@property(nonatomic, assign) CGFloat top;
@property(nonatomic, assign) CGFloat bottom;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;
@property(nonatomic, assign) CGFloat boundsWidth;
@property(nonatomic, assign) CGFloat boundsHeight;

@property(nonatomic, assign, readonly) BOOL needsAnimationWhenLayout;
- (void)allButtonSetExclusiveTouch;
- (void)setNeedsAnimationWhenLayout:(BOOL)needsAnimationWhenLayout recursive:(BOOL)recursive;
- (void)setNeedsAnimationWhenLayout:(BOOL)needsAnimationWhenLayout depth:(int)depth;

- (id)initWithFrame:(CGRect)frame associatedSubviewNameControllers:(NSDictionary*)subviewNameDictionary;
- (id)initWithAssociatedSubviewNameControllers:(NSDictionary*)subviewNameDictionary;
- (id)initWithFrame:(CGRect)frame associatedSubviewTypeControllers:(NSArray*)controllers;
- (id)initWithAssociatedSubviewTypeControllers:(NSArray*)controllers;

- (void)associateSubviewsWithPropertyNames:(NSDictionary*)subviewNameDictionary;
- (void)associateSubviewsWithPropertyTypes:(NSArray*)controllers;
@end
