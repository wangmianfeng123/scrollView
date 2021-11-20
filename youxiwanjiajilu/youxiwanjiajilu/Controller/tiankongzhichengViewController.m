//
//  tiankongzhichengViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "tiankongzhichengViewController.h"

#import "WRNavigationBar.h"
#import "AppDelegate.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "WRImageHelper.h"
#import "MainCell.h"
#import "shimujiajuViewController.h"
#import "xiyiyeViewController.h"
#define NAVBAR_COLORCHANGE_POINT (-IMAGE_HEIGHT + NAV_HEIGHT)
#define NAV_HEIGHT 64
#define IMAGE_HEIGHT 200
#define SCROLL_DOWN_LIMIT 70
#define LIMIT_OFFSET_Y -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

@interface tiankongzhichengViewController () <UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate >
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SDCycleScrollView *advView;
@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) NSArray * Texas_array;

@property (nonatomic, strong)QMUIEmptyView * empty;

@end

@implementation tiankongzhichengViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.view.backgroundColor = [UIColor blueColor];
    [self setupNavItems];
     self.tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT, 0, 0, 0);
    [self.tableView addSubview:self.advView];
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    self.tableView.tableFooterView = [UIView new];
    
    
    
    
//    [self wr_setNavBarBackgroundAlpha:0];
    
    
    _Texas_array = [Texas bg_findAll:nil];

    if (_Texas_array.count == 0) {
        [self steupEmpty];
    }
    
    [Texas bg_registerChangeForTableName:@"Texas" identify:@"change" block:^(bg_changeState result) {
        switch (result) {
            case bg_insert:
                if (self->_empty) {
                     [self->_empty removeFromSuperview];
                }
                self->_Texas_array = [Texas bg_findAll:nil];

                [self->_tableView reloadData];
                
                break;
                
            case bg_update:
                
                
                [self->_tableView reloadData];
                
                break;
            case bg_delete:
                
                break;
            case bg_drop:
                
                break;
            default:
                break;
        }
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTableview) name:@"ClearCacheReloadNotification" object:nil];
    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ClearCacheReloadNotification" object:nil];
    
}

-(void)reloadTableview{
    
  
    self.Texas_array = [Texas bg_findAll:nil];
    
    if (_Texas_array.count == 0) {
        [self steupEmpty];
    }
    
    [self.tableView reloadData];
    
}

- (void)setupNavItems
{
  
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(onClickRight)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    self.searchButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-100, 30)];
    [self.searchButton setTitle:@"Search Competition" forState:UIControlStateNormal];
    self.searchButton.titleLabel.font = [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:13.0f];
    [self.searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.searchButton setBackgroundColor:[UIColor whiteColor]];
    [self.searchButton setImage:[UIImage imageNamed:@"search_small"] forState:UIControlStateNormal];
    [self.searchButton setImageEdgeInsets:UIEdgeInsetsMake(0, -100, 0, 0)];
    self.searchButton.layer.cornerRadius = 10;
    self.searchButton.layer.masksToBounds = YES;
    [self.searchButton addTarget:self action:@selector(onClickSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = self.searchButton;
    
    
}

-(void)steupEmpty{
    
    self.empty =[[QMUIEmptyView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200)];
    
    [self.empty setBackgroundColor:[UIColor clearColor]];
    
    [self.empty setImage: [[UIImage imageNamed:@"emptybox"] qmui_imageResizedInLimitedSize:CGSizeMake(60, 60) resizingMode:QMUIImageResizingModeScaleToFill]];
    
        [self.empty setTextLabelText:@"empty"];
    
    [self.empty setLoadingViewHidden:YES];
    
    [self.view addSubview:self.empty];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY < -IMAGE_HEIGHT) {
//        [self updateNavBarButtonItemsAlphaAnimated:.0f];
//    } else {
//        [self updateNavBarButtonItemsAlphaAnimated:1.0f];
//    }
    
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
//        [self wr_setNavBarBackgroundAlpha:alpha];
        [self updateSearchBarColor:alpha];
    }
    else
    {
//        [self wr_setNavBarBackgroundAlpha:0];
        [self.searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    //限制下拉的距离
    if(offsetY < LIMIT_OFFSET_Y) {
        [scrollView setContentOffset:CGPointMake(0, LIMIT_OFFSET_Y)];
    }
}

//- (void)updateNavBarButtonItemsAlphaAnimated:(CGFloat)alpha
//{
//    [UIView animateWithDuration:0.2 animations:^{
//        [self.navigationController.navigationBar wr_setBarButtonItemsAlpha:alpha hasSystemBackIndicator:NO];
//    }];
//}

- (void)updateSearchBarColor:(CGFloat)alpha
{
   
    UIColor *color = [[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0] colorWithAlphaComponent:alpha];
    UIImage *image = [UIImage imageNamed:@"search"];
    image = [image wr_updateImageWithTintColor:color alpha:alpha];
    [self.searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
}

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Texas_array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MainCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"MainCell" forIndexPath:indexPath];
    
    Texas * texas = [_Texas_array objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.competition_img.image =[UIImage imageWithData: texas.photoData];
    
    cell.competition_name.text = texas.title;
    
    cell.competition_score.text = [NSString stringWithFormat:@"Amount Pot：%ld",texas.pot];
    
    cell.competition_date.text =  [NSString stringWithFormat:@"Date：%@",texas.date];
    
    cell.competition_persons.text =[NSString stringWithFormat:@"%lu players",(unsigned long)texas.Players.count];
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    Texas * texas =  [_Texas_array objectAtIndex:indexPath.row];
    
    xiyiyeViewController * xiyiyeView = [[xiyiyeViewController alloc]initWithNibName:@"xiyiyeViewController" bundle:nil];
    
    xiyiyeView.texas = texas;
    
    [self.navigationController pushViewController:xiyiyeView animated:YES];
    
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImage *)imageWithImageSimple:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width*2, newSize.height*2));
    [image drawInRect:CGRectMake (0, 0, newSize.width*2, newSize.height*2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (SDCycleScrollView *)advView
{
    if (_advView == nil) {
        NSArray *localImages = @[@"1", @"2", @"3", @"4"];
        _advView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -IMAGE_HEIGHT, kScreenWidth, IMAGE_HEIGHT) imageNamesGroup:localImages];
        _advView.pageDotColor = [UIColor grayColor];
        _advView.autoScrollTimeInterval = 2;
        _advView.currentPageDotColor = [UIColor whiteColor];
        _advView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    }
    return _advView;
}

- (void)onClickLeft
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)onClickRight
{
    shimujiajuViewController * shimujiaj = [[shimujiajuViewController alloc]init];
    
    [self.navigationController pushViewController:shimujiaj animated:YES];
    
    
}
- (void)onClickSearchBtn
{
    // 1. Create hotSearches array
    NSArray *hotSeaches = @[ @"WPT", @"Poker", @"Texas Hold’em poker", @"World Series Of Poker", @"WSOP",@"GPL"];
    // 2. Create searchViewController
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"Search Competition" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // Call this Block when completion search automatically
        // Such as: Push to a view controllercup
//        SearchViewController * search = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
//        search.searchText = searchText;
//        [searchViewController.navigationController pushViewController:search animated:YES];
        
        
        
    }];
    // 3. present the searchViewController
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav  animated:NO completion:nil];
    
    
}

//- (int)navBarBottom
//{
//    if ([WRNavigationBar isIphoneX]) {
//        return 88;
//    } else {
//        return 64;
//    }
//}

@end
