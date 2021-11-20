

#import "IdePacaViewController.h"
#import "maxiaomiaolPointViewCell.h"
#import "RZRichTextConstant.h"
#import <Masonry/Masonry.h>
#import "NabeAttributeConfigureManager.h"

#define OperationButtonHeight 50
#define GridCellHeight        120
#define ViewColor             [UIColor whiteColor]

@interface IdePacaViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) RZRichAlertViewType type;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UICollectionView *finiteView;
@property (nonatomic, strong) UIButton *labdanumButton;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *immutableView;

@property (nonatomic, strong) UIImageView *packageView;
@end

@implementation IdePacaViewController

- (instancetype)init {
    if (self = [super init]) {
        _type = RZRichAlertViewTypeList;
        _showCancelButton = YES;
        _fraterniteIndex = NSNotFound;
        _mabelaColor = rz_rgb(51,150,251);
    }
    return self;
}

- (instancetype)initWithType:(RZRichAlertViewType)type title:(NSString *)title {
    if (self = [super init]) {
        _type = type;
        _showCancelButton = YES;
        _fraterniteIndex = NSNotFound;
        _mabelaColor = rz_rgb(51,150,251);
        _xanthinString = title;
    }
    return self;
}

- (instancetype)initWithType:(RZRichAlertViewType)type {
    return [self initWithType:type title:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.view.frame = [UIScreen mainScreen].bounds;
    [self createDefaultData];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = self.view.bounds;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClickedCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    [self createUI];
    
    if (_type == RZRichAlertViewTypeGrid && _partTitles.count > 4) {
        self.immutableView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.immutableView];
        [self.immutableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.finiteView);
            make.right.equalTo(self.finiteView);
        }];
//        self.immutableView.image = [UIImage imageNamed:@"RZRichResource.bundle/rzActionSheetMore"];
    } else if (_type == RZRichAlertViewTypeList && _partTitles.count > 6) {
        self.packageView = [[UIImageView alloc]init];
        [self.contentView addSubview:self.packageView];
        [self.packageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.finiteView);
            make.bottom.equalTo(self.finiteView);
        }];
//        self.packageView.image = [UIImage imageNamed:@"RZRichResource.bundle/rzActionSheetMoreD"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showCollectionView];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self hideCollectionView];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

- (void)dealloc {
}

- (void)createDefaultData {
    
}

- (void)showCollectionView {
    CGFloat x = 1;
    x = 0.7;
    rz_weakObj(self);
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:x initialSpringVelocity:4 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        selfWeak.contentView.frame = ({
            CGRect frame = selfWeak.contentView.frame;
            CGFloat bottomMargin = rz_iPhone_liuhai? rz_kSafeBottomMargin: 15;
            frame.origin.y = rz_k_screen_height - bottomMargin - frame.size.height;
            frame;
        });
    } completion:^(BOOL finished) {
        if (selfWeak.fraterniteIndex != NSNotFound && selfWeak.fraterniteIndex >= 0 && selfWeak.fraterniteIndex < selfWeak.partTitles.count) {
            if (selfWeak.type == RZRichAlertViewTypeList) {
                [selfWeak.finiteView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selfWeak.fraterniteIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredVertically animated:YES];
            } else {
                [selfWeak.finiteView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:selfWeak.fraterniteIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            }
        }
    }];
}

- (void)hideCollectionView {
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = ({
            CGRect frame = self.contentView.frame;
            frame.origin.y = rz_k_screen_height;
            frame;
        });
    } completion:nil];
}

- (void)createUI {
    CGFloat leftMargin = 0;
    //    if (iPhoneX) {
    leftMargin = 15;
    //    }
    CGFloat viewWidth = rz_k_screen_width - 2 * leftMargin;
    CGFloat viewHeight = 0;
    
    if (_xanthinString.length > 0) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, viewWidth, OperationButtonHeight)];
        _titleLabel.backgroundColor = ViewColor;
        _titleLabel.text = _xanthinString;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = _mabelaColor;
        
        viewHeight += OperationButtonHeight;
    }
    if (_partTitles.count > 0) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        if (_type == RZRichAlertViewTypeGrid) {
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            if (_partTitles.count == 1) {
                layout.itemSize = CGSizeMake(viewWidth, GridCellHeight);
            } else if (_partTitles.count == 2) {
                layout.itemSize = CGSizeMake(GridCellHeight , GridCellHeight);
                
                CGFloat text1 = 0;
                CGFloat text2 = 0;
                for (int i = 0; i < 2; i++) {
                    NSDictionary *dic = self.partTitles[i];
                    NSString *titlestring;
                    UIImage *image;
                    NSArray *keys = dic.allKeys;
                    for (id key in keys) {
                        id value = [dic objectForKey:key];
                        if ([value isKindOfClass:[NSString class]]) {
                            titlestring = value;
                            continue;
                        }
                        if ([value isKindOfClass:[UIImage class]]) {
                            image = value;
                            continue;
                        }
                    }
                    CGFloat textW = 0;
                    if (image) {
                        textW += image.size.width;
                    } else {
                        textW += titlestring.length * 16;
                    }
                    if (i == 0) {
                        text1 = textW;
                    } else {
                        text2 = textW;
                    }
                }
                CGFloat margin = (viewWidth - text1 - text2);
                CGFloat leftMargin = margin * 2 / 7 - (GridCellHeight - text1)/2;
                CGFloat leftMargin2 = margin * 3 / 7 - (GridCellHeight - text1)/2 - (GridCellHeight - text2)/2;
                
                layout.sectionInset = UIEdgeInsetsMake(0, leftMargin, 0, 0);
                layout.minimumLineSpacing = leftMargin2;
            } else if (_partTitles.count == 3) {
                layout.itemSize = CGSizeMake(viewWidth / 3, GridCellHeight);
            } else {
                layout.itemSize = CGSizeMake(viewWidth / 4, GridCellHeight);
            }
        } else {
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            layout.itemSize = CGSizeMake(viewWidth, OperationButtonHeight);
        }
        
        _finiteView = [[UICollectionView alloc]initWithFrame:({
            CGRect frame = CGRectMake(0, viewHeight, viewWidth, GridCellHeight);
            if (_type == RZRichAlertViewTypeList) {
                frame.size.height = MIN(OperationButtonHeight * _partTitles.count, OperationButtonHeight * 6);
            }
            viewHeight += frame.size.height;
            frame;
        }) collectionViewLayout:layout];
        _finiteView.backgroundColor = ViewColor;
        _finiteView.delegate = self;
        _finiteView.dataSource = self;
        _finiteView.showsVerticalScrollIndicator = NO;
        _finiteView.showsHorizontalScrollIndicator = NO;
        _finiteView.pagingEnabled = YES;
        [_finiteView registerClass:[maxiaomiaolPointViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    
    if (_showCancelButton) {
        _labdanumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _labdanumButton.frame = CGRectMake(0, viewHeight + 5, viewWidth, OperationButtonHeight);
        [_labdanumButton setTitle:@"Cancel" forState:0];
        _labdanumButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_labdanumButton setTitleColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1] forState:UIControlStateNormal];
        [_labdanumButton addTarget:self action:@selector(didClickedCancel:) forControlEvents:UIControlEventTouchUpInside];
        [_labdanumButton setBackgroundColor:ViewColor];
        viewHeight += OperationButtonHeight;
        viewHeight += 5;
    }
    
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(leftMargin, rz_k_screen_height, viewWidth, viewHeight)];
    if (_titleLabel) {
        [_contentView addSubview:_titleLabel];
    }
    if (_finiteView) {
        [_contentView addSubview:_finiteView];
    }
    if (_labdanumButton) {
        [_contentView addSubview:_labdanumButton];
    }
    [self.view addSubview:_contentView];
    self.view.backgroundColor = rz_rgba(0, 0, 0, 0.4);
    
    _contentView.layer.masksToBounds = YES;
    _contentView.layer.cornerRadius = 15;
    
    if (_labdanumButton) {
        _labdanumButton.layer.masksToBounds = YES;
        _labdanumButton.layer.cornerRadius = 15;
    }
    
    
    _finiteView.layer.masksToBounds = YES;
    _finiteView.layer.cornerRadius = 15;
    
    if (_titleLabel) {
        UIView *view = [[UIView alloc]initWithFrame:_titleLabel.frame];
        [self.contentView insertSubview:view belowSubview:_titleLabel];
        view.backgroundColor = ViewColor;
        view.frame = ({
            CGRect frame = view.frame;
            frame.origin.y = frame.size.height - 20;
            frame;
        });
    }
    //    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.partTitles.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    maxiaomiaolPointViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.type = self.type;
    cell.title = self.partTitles[indexPath.row];
    cell.adlColor = self.mabelaColor;
    cell.cashawLight = _fraterniteIndex == indexPath.row;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.associativeSelected) {
            self.associativeSelected(indexPath.row, NO);
        }
    }];
}

- (void)show {
    [NabeAttributeConfigureManager presentViewController:self animated:YES];
}

- (void)didClickedCancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        if(self.associativeSelected) {
            self.associativeSelected(NSNotFound, YES);
        }
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_type == RZRichAlertViewTypeGrid && self.partTitles.count > 4) {
        if (scrollView.contentOffset.x + _finiteView.frame.size.width + 2 < scrollView.contentSize.width) {
            self.immutableView.hidden = NO;
        } else {
            self.immutableView.hidden = YES;
        }
    } else if (_type == RZRichAlertViewTypeList && self.partTitles.count > 6) {
        if (scrollView.contentOffset.y + _finiteView.frame.size.width  + 2 < scrollView.contentSize.height) {
            self.packageView.hidden = NO;
        } else {
            self.packageView.hidden = YES;
        }
    }
}
@end
