

#import "tongrentangFinalizerAccessoryView.h"
#import <Masonry/Masonry.h>
#import "ClipboardBabassuInputCell.h"
#import "NabeAttributeConfigureManager.h"
#import "ConvexZabaglioneColorCell.h"
#import "ModelingClassificationColorCell.h"

@interface tongrentangFinalizerAccessoryView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *underflowBtn;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) CGFloat overloadHeight;

@property (nonatomic, weak) UIView *actionView;

@end

@implementation tongrentangFinalizerAccessoryView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self underflowBtn];
        [self collectionView];
        
        [self.underflowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.equalTo(self);
            make.width.height.equalTo(@44);
        }];
        
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self);
            make.height.equalTo(@44);
            make.right.equalTo(self.underflowBtn.mas_left);
        }];
        
        [self registerClass:[ClipboardBabassuInputCell class] forAccessoryItemCellWithIdentifier:@"defCell"];
        [self registerClass:[ConvexZabaglioneColorCell class] forAccessoryItemCellWithIdentifier:@"def1Cell"];
        [self registerClass:[ModelingClassificationColorCell class] forAccessoryItemCellWithIdentifier:@"def2Cell"];

        NSDictionary *dict = [NabeAttributeConfigureManager manager].namespaceCells.copy;
        for (NSString *key in dict.allKeys) {
            [self registerClass:dict[key] forAccessoryItemCellWithIdentifier:key];
        }

        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeItemKeyboard) name:UIDeviceOrientationDidChangeNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardInfo:) name:UIKeyboardDidChangeFrameNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (UIButton *)underflowBtn {
    if (!_underflowBtn) {
        _underflowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_underflowBtn];
        [_underflowBtn setImage:k_zouxiangni_richImage(@"escape_jp") forState:UIControlStateNormal];
        [_underflowBtn addTarget:self action:@selector(closeKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    return _underflowBtn;
}
- (void)closeKeyboard {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)closeItemKeyboard {
    
}
- (void)keyboardInfo:(NSNotification *)notification {
    NSValue *value = notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"];
    CGRect frame = value.CGRectValue;
    self.overloadHeight = frame.size.height - 44; 
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(44, 44);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 300, 44) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [self addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    }
    return _collectionView;
}

- (void)registerClass:(Class)class forAccessoryItemCellWithIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:class forCellWithReuseIdentifier:identifier];
}

- (void)reloadData {
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.scalableItems.count;
};

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath { 
    ScrollMacAttributeItem *item = self.scalableItems[indexPath.row];
    if (self.cellForItemAtIndePath) {
        UICollectionViewCell *cell = self.cellForItemAtIndePath(collectionView, indexPath, item);
        if (cell) {
            return cell;
        }
    }
    
    if (NabeAttributeConfigureManager.manager.cellForItemAtIndePath) {
        UICollectionViewCell *cell = NabeAttributeConfigureManager.manager.cellForItemAtIndePath(collectionView, indexPath, item);
        if (cell) {
            return cell;
        }
    }
    UIColor *color = item.videoParams[@"color"];
    if (item.type == RZRichTextAttributeTypeFontColor || item.type == RZRichTextAttributeTypeStroke) {
        ConvexZabaglioneColorCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"def1Cell" forIndexPath:indexPath];
        cell.imageView.image = item.displayImage;
        cell.yachtswomanView.backgroundColor = color;
        return cell;
    } else if (item.type == RZRichTextAttributeTypeFontBackgroundColor) {
        ModelingClassificationColorCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"def2Cell" forIndexPath:indexPath];
        cell.imageView.image = item.displayImage;
        cell.yachtswomanView.backgroundColor = color;
        return cell;
    } else {
        ClipboardBabassuInputCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"defCell" forIndexPath:indexPath];
        cell.imageView.image = item.displayImage;
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.openIndex) {
        self.openIndex(indexPath.row);
    }
}

@end
