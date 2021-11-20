//
//  dongtiantailengViewController.m
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import "dongtiantailengViewController.h"
#import "anyoushuibeiCell.h"
#import "RazesterViewController.h"
@interface dongtiantailengViewController ()<NSFetchedResultsControllerDelegate,MGSwipeTableCellDelegate>
@property (weak, nonatomic) IBOutlet tannaomenTableView *listTableview;
@property (nonatomic,strong)NSFetchedResultsController * fetchResultsController;

@end

@implementation dongtiantailengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];
    
    [self.fetchResultsController performFetch:NULL];

    if (kISNullArray(self.fetchResultsController.fetchedObjects)) {
        [self.listTableview showEmptyView];
    }else{
        [self.listTableview hiddenEmptyView];
        
    }

    self.listTableview.estimatedRowHeight = 0;

   
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return self.fetchResultsController.sections.count;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.fetchResultsController.sections[section].numberOfObjects;
    
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    
    if (kISNullArray(self.fetchResultsController.fetchedObjects)) {
        [self.listTableview showEmptyView];
    }else{
        [self.listTableview hiddenEmptyView];
        
    }

    [self.listTableview reloadData];
 
}

-(NSFetchedResultsController*)fetchResultsController{
    
    if (_fetchResultsController != nil)  return _fetchResultsController;
    
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"TimeEntity"];
    
    NSSortDescriptor * sort  =[NSSortDescriptor sortDescriptorWithKey:@"dater" ascending:NO];
    
    request.sortDescriptors =@[sort];
    
    _fetchResultsController =[[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:[MKCoreDataManager shareManager].managedObjectContext sectionNameKeyPath:@"date" cacheName:nil];
    
    
    _fetchResultsController.delegate =self;
    
    return _fetchResultsController;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    anyoushuibeiCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.fd_enforceFrameLayout = YES;

    TimeEntity *timeentity = [self.fetchResultsController objectAtIndexPath:indexPath];
    
    cell.title.text = [NSString stringWithFormat:@"标题：%@",timeentity.title];

    cell.catoary.text =[NSString stringWithFormat:@"分类：%@",timeentity.cateray];

    cell.date.text =[NSString stringWithFormat:@"日期：%@",timeentity.date];

    cell.note.text =[NSString stringWithFormat:@"备注：%@",timeentity.note];

    NSDate * date =  [self formaterYearAndMonth:timeentity.date];
    
    NSTimeInterval time_first = [[NSDate date] timeIntervalSince1970];
    
    NSTimeInterval time_scend = [date timeIntervalSince1970];
    
    NSTimeInterval  day_number = (time_scend-time_first)/(60*60*24);
    
    NSLog(@"time = %f ,%f",time_scend,day_number);
    
    NSInteger hour  = ((NSInteger)time_scend-(NSInteger)time_first)%(60*60*24) / (60*60);
    if ((time_scend-time_first)>0) {
        //[self performAnimation:cell withCountNumber:day_number withCountHour:hour];
        cell.destdate.text =[NSString stringWithFormat:@"%0.0f天%ld时",day_number,hour];

    }else{
       // [self performAnimation:cell withCountNumber:-day_number withCountHour:-hour];

        cell.destdate.text =[NSString stringWithFormat:@"%0.0f天%ld时",-day_number,-hour];

    }

    cell.delegate = self;
    cell.allowsMultipleSwipe = YES;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    
    return [self.listTableview fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(anyoushuibeiCell* cell) {
        
        cell.fd_enforceFrameLayout = YES;

        TimeEntity *timeentity = [self.fetchResultsController objectAtIndexPath:indexPath];
        
        cell.title.text = [NSString stringWithFormat:@"标题：%@",timeentity.title];
        
        cell.catoary.text =[NSString stringWithFormat:@"分类：%@",timeentity.cateray];
        
        cell.date.text =[NSString stringWithFormat:@"日期：%@",timeentity.date];
        
        cell.note.text =[NSString stringWithFormat:@"备注：%@",timeentity.note];
        
        
        NSDate * date =  [self formaterYearAndMonth:timeentity.date];
        
        NSTimeInterval time_first = [[NSDate date] timeIntervalSince1970];
        
        NSTimeInterval time_scend = [date timeIntervalSince1970];
        
        NSTimeInterval  day_number = (time_scend-time_first)/(60*60*24);
        
        NSLog(@"time = %f ,%f",time_scend,day_number);
        NSInteger hour  = ((NSInteger)time_scend-(NSInteger)time_first)%(60*60*24) / (60*60);
        cell.destdate.text =[NSString stringWithFormat:@"%0.0f天%ld时",day_number,hour];

        
        cell.delegate = self;
        cell.allowsMultipleSwipe = YES;
    }];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    TimeEntity *timeentity = [self.fetchResultsController objectAtIndexPath:indexPath];

    
    //[self performSegueWithIdentifier:@"detail_indfer" sender:timeentity];
    RazesterViewController * RazesterViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RazesterViewController"];
    RazesterViewController.timeEntity = timeentity;
    [self.navigationController pushViewController:RazesterViewController withCATransitionType:8 subType:2 animated:YES];
    

}


-(NSArray*) swipeTableCell:(MGSwipeTableCell*) cell swipeButtonsForDirection:(MGSwipeDirection)direction
             swipeSettings:(MGSwipeSettings*) swipeSettings expansionSettings:(MGSwipeExpansionSettings*) expansionSettings;
{

    if (direction == MGSwipeDirectionLeftToRight) {
        return [NSArray array];
    }
    else {
        
        return [self createRightButtons:2];
      
    }
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell tappedButtonAtIndex:(NSInteger) index direction:(MGSwipeDirection)direction fromExpansion:(BOOL) fromExpansion
{
    NSIndexPath * path = [self.listTableview indexPathForCell:cell];

    if (direction == MGSwipeDirectionRightToLeft && index == 0) {
        
        [[MKCoreDataManager shareManager].managedObjectContext deleteObject:
         [self.fetchResultsController objectAtIndexPath:path]];
        if ([[MKCoreDataManager shareManager]saveContext]) {
            [self.listTableview reloadData];

        }
        return NO;
    }else if (direction == MGSwipeDirectionRightToLeft && index == 1) {
        
        TimeEntity *timeentity = [self.fetchResultsController objectAtIndexPath:path];

        RazesterViewController * RazesterViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"RazesterViewController"];
        RazesterViewController.timeEntity = timeentity;
        [self.navigationController pushViewController:RazesterViewController withCATransitionType:8 subType:2 animated:YES];
    }

    return YES;
}
 #pragma mark - Navigation

-(NSString *)formaterYearAndMonth{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString * str = [formatter stringFromDate:[NSDate date]];
    
    return str;
    
}



-(NSDate *)formaterYearAndMonth:(NSString*)string{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate * date = [formatter dateFromString:string];
    
    return date;
    
}



-(NSArray *) createLeftButtons: (int) number
{
    NSMutableArray * result = [NSMutableArray array];
    UIColor * colors[3] = {[UIColor greenColor],
        [UIColor colorWithRed:0 green:0x99/255.0 blue:0xcc/255.0 alpha:1.0],
        [UIColor colorWithRed:0.59 green:0.29 blue:0.08 alpha:1.0]};
    UIImage * icons[3] = {[UIImage imageNamed:@"check.png"], [UIImage imageNamed:@"fav.png"], [UIImage imageNamed:@"menu.png"]};
    for (int i = 0; i < number; ++i)
    {
        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:@"" icon:icons[i] backgroundColor:colors[i] padding:15 callback:^BOOL(MGSwipeTableCell * sender){
            NSLog(@"Convenience callback received (left).");
            return YES;
        }];
        [result addObject:button];
    }
    return result;
}


-(NSArray *) createRightButtons: (int) number
{
    NSMutableArray * result = [NSMutableArray array];
    NSString* titles[2] = {@"删除", @"编辑"};
    UIColor * colors[2] = {[UIColor blueColor], [UIColor redColor]};
    for (int i = 0; i < number; ++i)
    {
        MGSwipeButton * button = [MGSwipeButton buttonWithTitle:titles[i] backgroundColor:colors[i] callback:^BOOL(MGSwipeTableCell * sender){
            NSLog(@"Convenience callback received (right).");
            BOOL autoHide = i != 0;
            return autoHide; //Don't autohide in delete button to improve delete expansion animation
        }];
        [result addObject:button];
    }
    return result;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    [self prepareVisibleCellsForAnimation];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self animateVisibleCells];
}

#pragma mark - Private

- (void)prepareVisibleCellsForAnimation {
    
    
    for (int i = 0; i < [self.listTableview.visibleCells count]; i++) {
        anyoushuibeiCell * cell = (anyoushuibeiCell *) [self.listTableview.visibleCells objectAtIndex:i];
       // NSIndexPath *path = [self.listTableview indexPathForCell:cell];
        
        cell.frame = CGRectMake(-CGRectGetWidth(cell.bounds), cell.frame.origin.y, CGRectGetWidth(cell.bounds), CGRectGetHeight(cell.bounds));
        cell.alpha = 0.f;
    }
    

}

- (void)animateVisibleCells {
    for (int i = 0; i < [self.listTableview.visibleCells count]; i++) {
        anyoushuibeiCell * cell = (anyoushuibeiCell *) [self.listTableview.visibleCells objectAtIndex:i];

        cell.alpha = 1.f;
        [UIView animateWithDuration:0.25f
                              delay:i * 0.1
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             cell.frame = CGRectMake(0.f, cell.frame.origin.y, CGRectGetWidth(cell.bounds), CGRectGetHeight(cell.bounds));
                         }
                         completion:nil];
    }
}

-(void)performAnimation:(anyoushuibeiCell *)cell withCountNumber:(NSTimeInterval)number withCountHour:(NSInteger)hour
{
    [cell.destdate pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 10.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        // read value
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = [[obj description] floatValue];
        };
        // write value
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"%.0f天",values[0]]];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];
    
    anim.property = prop;
    
    anim.fromValue = @(0.0);
    anim.toValue = @(number);
    
    [cell.destdate pop_addAnimation:anim forKey:@"counting"];
    
    
    [cell.hour pop_removeAllAnimations];
    POPBasicAnimation *anim_hour = [POPBasicAnimation animation];
    anim_hour.duration = 10.0;
    anim_hour.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    POPAnimatableProperty * prop_hour = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        // read value
        prop.readBlock = ^(id obj, CGFloat values[]) {
            values[0] = [[obj description] floatValue];
        };
        // write value
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"%.0f时",values[0]]];
        };
        // dynamics threshold
        prop.threshold = 0.01;
    }];
    
    anim_hour.property = prop_hour;
    
    anim_hour.fromValue = @(0.0);
    anim_hour.toValue = @(hour);
    
    [cell.hour pop_addAnimation:anim_hour forKey:@"counting"];
    
}
@end
