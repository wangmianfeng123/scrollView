//
//  UIViewAdditions.m
//  HMContacts
//
//  Created by hyq he on 4/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewAdditions.h"

BOOL classDescendsFromClass(Class classA, Class classB)
{
    while(true)
    {
        if(classA == classB) return YES;
        id superClass = class_getSuperclass(classA);
        if(classA == superClass) return (superClass == classB);
        classA = superClass;
    }
}

const char *getPropertyType(objc_property_t property)
{
    const char *attributes = property_getAttributes(property);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) > 4) {
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "@";
}

const char *findPropertyNameFromType(Class class,const char *propertyType)
{
    unsigned int outCount;
    const char * keyName = NULL;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for(int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propType = getPropertyType(property);
        if (strcmp(propType,propertyType) == 0) {
            keyName = property_getName(property);
            break;
        }
    }
    free(properties);
    return keyName;
}

@interface UIView (CTAdditions_Internal)

- (void)setChiefController:(UIViewController *)chiefController;

@end

static const char * animationWhenLayoutKey = "Animation_When_Layout";

@implementation UIView (CTAdditions)
@dynamic needsAnimationWhenLayout;
/*
- (id)initWithChiefController:(UIViewController*)viewController
{
    if (self = [self init]) {
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([viewController class], &outCount);
        for(int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            const char *propType = getPropertyType(property);
            if(propType) {
                NSString *propertyType = [NSString stringWithUTF8String:propType];
                Class c = NSClassFromString(propertyType);
                
                BOOL isDescend = classDescendsFromClass(c,[UIViewController class]);
                if (isDescend) {
                    const char * keyName = property_getName(property);
                    UIViewController* vc =[viewController valueForKey:[NSString stringWithUTF8String:keyName]];
                    UIViewController* hasChief =  vc.chiefController;
                    if (hasChief) {
                        const char * propertyName = findPropertyNameFromType([self class],object_getClassName(vc.view));
                        [self setValue:vc.view forKey:[NSString stringWithUTF8String:propertyName]];
                        
                    }
                               
                }
      

            }
        }
        free(properties);
    }
    return self;
}
*/
- (void)allButtonSetExclusiveTouch{
    for (UIView * view in [self subviews]) {
        if([view isKindOfClass:[UIButton class]])
        [view setExclusiveTouch:YES];
        else if ([view isKindOfClass:[UIView class]]){
            [view allButtonSetExclusiveTouch];
        }
    }
}
- (id)initWithFrame:(CGRect)frame associatedSubviewNameControllers:(NSDictionary*)subviewNameDictionary
{
    if (self = [self initWithFrame:frame]) {
        [self associateSubviewsWithPropertyNames:subviewNameDictionary];
    }
    return self;
}

- (id)initWithAssociatedSubviewNameControllers:(NSDictionary*)subviewNameDictionary
{
    if (self = [self init]) {
        [self associateSubviewsWithPropertyNames:subviewNameDictionary];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame associatedSubviewTypeControllers:(NSArray*)controllers
{
    if (self = [self initWithFrame:frame]) {
        [self associateSubviewsWithPropertyTypes:controllers];
    }
    return self;
}

- (id)initWithAssociatedSubviewTypeControllers:(NSArray*)controllers
{
    if (self = [self init]) {
        [self associateSubviewsWithPropertyTypes:controllers];
    }
    return self;
}

- (void)associateSubviewsWithPropertyTypes:(NSArray*)controllers
{
    if ([controllers count] > 0) {
        for (id controller in controllers) {
            if ([controller isKindOfClass:[UIViewController class]]) {
                const char * propertyName = findPropertyNameFromType([self class],object_getClassName(((UIViewController*)controller).view));
                NSString *keyName = [NSString stringWithUTF8String:propertyName];
                
                [((UIViewController*)controller) viewWillAppear:NO];
                [self setValue:((UIViewController*)controller).view forKey:keyName];
                [((UIViewController*)controller) viewDidAppear:NO];
            }
        }
    }
}

- (void)associateSubviewsWithPropertyNames:(NSDictionary*)subviewNameDictionary
{
    if ([subviewNameDictionary count] > 0) {
        unsigned int outCount;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for(int i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString* keyName = [NSString stringWithUTF8String:property_getName(property)];
            id value = [subviewNameDictionary objectForKey:keyName];
            if(value && [value isKindOfClass:[UIViewController class]])
            {
                /*
                id sub = [self valueForKey:keyName];
                if (sub && [sub isKindOfClass:[UIView class]]) {
                    //[((UIViewController*)oldController) viewWillDisappear:NO];
                    [(UIView*)sub removeFromSuperview];
                    //[((UIViewController*)oldController) viewDidDisappear:NO];
                }
                 */
                [((UIViewController*)value) viewWillAppear:NO];
                [self setValue:((UIViewController*)value).view forKey:keyName];
                /*
                if ([self respondsToSelector:@selector(viewDidAssociated:)]) {
                    [self performSelector:@selector(viewDidAssociated:) withObject:((UIViewController*)value).view];
                }
                 */
                [((UIViewController*)value) viewDidAppear:NO];
            }
            
        }
        free(properties);
    }
}

- (void)setNeedsAnimationWhenLayout:(BOOL)needsAnimationWhenLayout recursive:(BOOL)recursive
{
    [self setNeedsAnimationWhenLayout:needsAnimationWhenLayout depth:recursive ? 99 : 0];
}

//递归的设定需要在layoutSubviews方法中用动画的函数,depth表示深度
- (void)setNeedsAnimationWhenLayout:(BOOL)needsAnimationWhenLayout depth:(int)depth
{
    if (needsAnimationWhenLayout) {
        objc_setAssociatedObject(self, animationWhenLayoutKey,[NSNumber numberWithBool:needsAnimationWhenLayout],OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        objc_setAssociatedObject(self, animationWhenLayoutKey, nil, OBJC_ASSOCIATION_ASSIGN);
    }

    if (depth > 0) {
        for (UIView * v in self.subviews) {
            if ([v isKindOfClass:[UIView class]]) {
                [v setNeedsAnimationWhenLayout:needsAnimationWhenLayout depth:depth - 1];
            }
        }
    }
}


- (BOOL)needsAnimationWhenLayout
{
    id result = objc_getAssociatedObject(self, animationWhenLayoutKey);
    if (result && [result isKindOfClass:[NSNumber class]]) {
        return [((NSNumber*)result) boolValue];
    }
    return NO;
}
/*
 * didAddSubview是系统api, 暂时可以重写, 原因是didAddSubview方法系统默认do nothing
 * 当UIView有默认实现的时候不能重写改方法 //revise
 */
- (void)didAddSubview:(UIView *)subview
{
    if (self.needsAnimationWhenLayout) {
        [subview setNeedsAnimationWhenLayout:YES recursive:YES];
    }
}
/*
 * 不能重写uiview的dealloc, 会有问题, 系统级的dealloc可能做了对UIView的专门处理, 绝对不能重写
 */
//this will be release by system
/*
if (nil != objc_getAssociatedObject(self, animationWhenLayoutKey)) {
    objc_setAssociatedObject(self,animationWhenLayoutKey,nil,OBJC_ASSOCIATION_ASSIGN);         
}
*/

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)boundsWidth
{
    return self.bounds.size.width;
}

//- (CGFloat)frameX
//{
//    return self.frame.origin.x;
//}
//- (CGFloat)frameY
//{
//    return self.frame.origin.y;
//}
- (void)setBoundsWidth:(CGFloat)boundsWidth
{
    CGRect bounds = self.bounds;
    bounds.size.width = boundsWidth;
    self.bounds = bounds;
}

- (CGFloat)boundsHeight
{
    return self.bounds.size.height;
}

- (void)setBoundsHeight:(CGFloat)boundsHeight
{
    CGRect bounds = self.bounds;
    bounds.size.height = boundsHeight;
    self.bounds = bounds;
}

///********************size&setSize*********************///
//这俩哥哥方法不能这么干,修改这两个方法会导致系统问题,比如UITextView不正常
//- (CGSize)size { return self.bounds.size; }
//- (void)setSize:(CGSize)size { CGRect bounds = self.bounds; bounds.size = size; self.bounds = bounds; }

@end
