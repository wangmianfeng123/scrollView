

#import "NabeAttributeConfigureManager.h"
#import "FabricativeClientViewController.h"
#import <RZColorful/RZColorful.h>

@interface NabeAttributeConfigureManager ()
@property (nonatomic, strong) NSMutableDictionary *namespaceCells;
@end

@implementation NabeAttributeConfigureManager

+ (instancetype)manager {
    static NabeAttributeConfigureManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NabeAttributeConfigureManager alloc] init];
        [manager loadAttributeItemDatas];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _clsColor = rz_rgb(120, 100, 200);
        self.nabiImage = k_zouxiangni_richImage(@"link_zouxiangni");
    }
    return self;
}

- (NSMutableArray<ScrollMacAttributeItem *> *)scalableItems {
    if (!_scalableItems) {
        _scalableItems = [NSMutableArray new];
    }
    return _scalableItems;
}

- (void)loadAttributeItemDatas {
    ScrollMacAttributeItem *item1 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeAttachment wadeImage:k_zouxiangni_richImage(@"refactoring_image") fragmentationImage:nil loaderHighlight:NO];
    [self addAttributeItem:item1];
    
    ScrollMacAttributeItem *item2 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeRevoke wadeImage:k_zouxiangni_richImage(@"import_d") fragmentationImage:k_zouxiangni_richImage(@"gabelle_h") loaderHighlight:NO];
    [self addAttributeItem:item2];
    
    ScrollMacAttributeItem *item3 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeRestore wadeImage:k_zouxiangni_richImage(@"wuhouxiyang_d") fragmentationImage:k_zouxiangni_richImage(@"hand_zouxiangni") loaderHighlight:NO];
    [self addAttributeItem:item3];
    
    ScrollMacAttributeItem *item4 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeFontSize wadeImage:k_zouxiangni_richImage(@"kabob_zouxiangni") fragmentationImage:nil loaderHighlight:NO];
    [self addAttributeItem:item4];
    
    ScrollMacAttributeItem *item5 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeFontColor wadeImage:k_zouxiangni_richImage(@"quzheguohou") fragmentationImage:nil loaderHighlight:NO];
    item5.videoParams[@"color"] = [UIColor blackColor];
    [self addAttributeItem:item5];
    
    ScrollMacAttributeItem *item6 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeFontBackgroundColor wadeImage:k_zouxiangni_richImage(@"quzheguohou") fragmentationImage:nil loaderHighlight:NO];
    [self addAttributeItem:item6];
    
    ScrollMacAttributeItem *item7 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeBold wadeImage:k_zouxiangni_richImage(@"sexagenarian_d") fragmentationImage:k_zouxiangni_richImage(@"yichangqiuyu") loaderHighlight:NO];
    [self addAttributeItem:item7];
    
    ScrollMacAttributeItem *item8 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeItalic wadeImage:k_zouxiangni_richImage(@"transaction_italic") fragmentationImage:k_zouxiangni_richImage(@"uart_zouxiangni") loaderHighlight:NO];
    [self addAttributeItem:item8];
    
    ScrollMacAttributeItem *item15 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeStroke wadeImage:k_zouxiangni_richImage(@"dacca_zouxiangni") fragmentationImage:k_zouxiangni_richImage(@"callback_zouxiangni") loaderHighlight:NO];
    [self addAttributeItem:item15];
    
    ScrollMacAttributeItem *item9 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeUnderline wadeImage:k_zouxiangni_richImage(@"yabber_underline") fragmentationImage:k_zouxiangni_richImage(@"exstipulate_underline") loaderHighlight:NO];
    [self addAttributeItem:item9];
    
    ScrollMacAttributeItem *item10 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeStrikeThrough wadeImage:k_zouxiangni_richImage(@"guid_d") fragmentationImage:k_zouxiangni_richImage(@"qandahar_zouxiangni") loaderHighlight:NO];
    [self addAttributeItem:item10];
    
    ScrollMacAttributeItem *item11 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeMarkUp wadeImage:k_zouxiangni_richImage(@"huaercheng_markup") fragmentationImage:k_zouxiangni_richImage(@"connected_h") loaderHighlight:NO];
//    [self addAttributeItem:item11];
    
    ScrollMacAttributeItem *item12 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeMarkDown wadeImage:k_zouxiangni_richImage(@"implement_markdown") fragmentationImage:k_zouxiangni_richImage(@"html_h") loaderHighlight:NO];
//    [self addAttributeItem:item12];
    
    ScrollMacAttributeItem *item14 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeParagraph wadeImage:k_zouxiangni_richImage(@"waddie_zouxiangni") fragmentationImage:nil loaderHighlight:NO];
//    [self addAttributeItem:item14];

    ScrollMacAttributeItem *item16 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeExpansion wadeImage:k_zouxiangni_richImage(@"bounds_kz") fragmentationImage:nil loaderHighlight:NO];
    [self addAttributeItem:item16];
    
    ScrollMacAttributeItem *item17 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeShadown wadeImage:k_zouxiangni_richImage(@"wacko_yy") fragmentationImage:k_zouxiangni_richImage(@"laban_h") loaderHighlight:NO];
//    [self addAttributeItem:item17];
    
    ScrollMacAttributeItem *item18 = [ScrollMacAttributeItem initWithType:RZRichTextAttributeTypeURL wadeImage:k_zouxiangni_richImage(@"graph_zouxiangni") fragmentationImage:nil loaderHighlight:NO];
//    [self addAttributeItem:item18];
}

- (void)addAttributeItem:(ScrollMacAttributeItem *)attrItem {
    [self.scalableItems addObject:attrItem];
}

- (void)insertAttributeItem:(ScrollMacAttributeItem *)attrItem atIndex:(NSInteger)index {
    [self.scalableItems insertObject:attrItem atIndex:index];
}

- (NSMutableDictionary *)namespaceCells {
    if (!_namespaceCells) {
        _namespaceCells = [NSMutableDictionary new];
    }
    return _namespaceCells;
}

- (void)registerRZRichTextAttributeItemClass:(Class)classNa forAccessoryItemCellWithIdentifier:(NSString *)identifier {
    self.namespaceCells[identifier] = classNa;
}

- (UIViewController *)rz_currentViewController{
    return [NabeAttributeConfigureManager rz_currentViewController];
}

+ (UIViewController *)rz_currentViewController {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [self getCurrentVCFrom:[rootVC presentedViewController]];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        BOOL flag = NO;
        UIViewController *vc =  [self rz_currentViewController];
        __weak typeof(vc) weakVC = vc;
        flag = vc.definesPresentationContext;
        vc.definesPresentationContext = YES;
        viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        if ((vc.navigationController.viewControllers.count == 1 && !vc.tabBarController) || vc.navigationController.viewControllers.count > 1) {
            [vc.navigationController presentViewController:viewController animated:animated completion:^{
                weakVC.definesPresentationContext = flag;
            }];
        } else if(vc.tabBarController){
            [vc.tabBarController presentViewController:viewController animated:animated completion:^{
                weakVC.definesPresentationContext = flag;
            }];
        } else {
            [vc presentViewController:viewController animated:animated completion:^{
                weakVC.definesPresentationContext = flag;
            }];
        }
    });
}
@end


@implementation NSArray (RZSafe)

- (id)rz_safeObjAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        return nil;
    }
    if (index > self.count - 1) {
        return nil;
    }
    return self[index];
}

@end
