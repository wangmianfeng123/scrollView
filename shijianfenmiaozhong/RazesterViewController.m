//
//  RazesterViewController.m
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import "RazesterViewController.h"

@interface RazesterViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    
    UITextField * _title_Textfiled;
    
}
@property (nonatomic,strong)NSString  * datestr;
@property (nonatomic,strong)NSString  * catoryName;
@property (nonatomic,strong)UIButton * button_right;

@property (weak, nonatomic) IBOutlet UILabel *tittle;

@property (weak, nonatomic) IBOutlet UILabel *catory;

@property (weak, nonatomic) IBOutlet UILabel *date;


@property (weak, nonatomic) IBOutlet UITextView *noteTextview;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *title_tap;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *catory_tap;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *date_tap;


@property (nonatomic)BOOL isEdit;
@end

@implementation RazesterViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [_title_Textfiled resignFirstResponder];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        
        
        [self.noteTextview resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tittle.text = self.timeEntity.title;
    
    self.catory.text = self.timeEntity.cateray;
    
    self.date.text  = self.timeEntity.date;
    
    self.noteTextview.text  = self.timeEntity.note;
    self.noteTextview.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.noteTextview setUserInteractionEnabled:NO];
    
    self.title_tap.enabled = NO;
    self.catory_tap.enabled = NO;
    self.date_tap.enabled = NO;
    
    self.isEdit = NO;
    
    
    [self setupBarItem];

}
- (IBAction)delete:(id)sender {
    
    
    [[MKCoreDataManager shareManager].managedObjectContext deleteObject:self.timeEntity];
    
    if([[MKCoreDataManager shareManager]saveContext]){
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}
-(void)setupBarItem {
    
    self.button_right =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
   
    [self.button_right setTitle:@"编辑" forState:UIControlStateNormal];

    UIBarButtonItem * barButoonItem_right = [[UIBarButtonItem alloc]initWithCustomView:self.button_right];
    
    self.navigationItem.rightBarButtonItem =barButoonItem_right;
    
    [self.button_right addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside]
;
}

- (IBAction)title:(id)sender {
    [QMUIDialogViewController appearance].headerViewBackgroundColor  = navBar_color;
    
    [QMUIDialogViewController appearance].headerViewHeight =40;
    
    
    QMUIDialogViewController *dilog = [[QMUIDialogViewController alloc]init];
    
    dilog.title = @"编辑标题";
    
    dilog.titleTintColor =kRGBColor(255, 255, 255);
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0,300, 100)];
    
    _title_Textfiled =  [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    
    _title_Textfiled.delegate = self;
    
    _title_Textfiled.text  = self->_timeEntity.title;
    
    _title_Textfiled.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:_title_Textfiled];
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
            
            
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        self->_tittle.text = self->_title_Textfiled.text;
        
        //  [self->_title_Textfiled resignFirstResponder];
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
    
    [dilog setButtonBackgroundColor:navBar_color];
    [dilog setButtonTitleAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:14]}];
    
    
    [dilog showWithAnimated:YES completion:^(BOOL finished) {
        
    }];
    
    
}
- (IBAction)catory:(id)sender {
    [QMUIDialogViewController appearance].headerViewBackgroundColor  = navBar_color;
    
    [QMUIDialogViewController appearance].headerViewHeight =40;
    
    
    QMUIDialogViewController *dilog = [[QMUIDialogViewController alloc]init];
    
    dilog.title = @"选择分类";
    
    dilog.titleTintColor =kRGBColor(255, 255, 255);
    
    bingtangxueliView * view =[[bingtangxueliView alloc]initWithFrame:CGRectMake(0, 0,300, 150)];
    
    [view selectCatoryIndexPathWithName:  self.timeEntity.cateray withBlock:^(NSString * _Nullable CatoryName) {
        self->_catoryName = CatoryName;

    }];
    
    view.catoryBlock = ^(NSString *CatoryName) {
        self->_catoryName = CatoryName;
    };
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        
        self->_catory.text = self->_catoryName;
        
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
    
    [dilog setButtonBackgroundColor:navBar_color];
    [dilog setButtonTitleAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:14]}];
    
    
    [dilog showWithAnimated:YES completion:^(BOOL finished) {
        
    }];
    
    
}
- (IBAction)date:(id)sender {
    
    [QMUIDialogViewController appearance].headerViewBackgroundColor  = navBar_color;
    
    [QMUIDialogViewController appearance].headerViewHeight =40;
    
    
    QMUIDialogViewController *dilog = [[QMUIDialogViewController alloc]init];
    
    dilog.title = @"选择日期";
    
    dilog.titleTintColor =kRGBColor(255, 255, 255);
    
    yuanfangPicker * view =[[yuanfangPicker alloc]initWithFrame:CGRectMake(0, 0,300, 100) withDate:self.timeEntity.date dateBlock:^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day) {
        
        self.datestr = [NSString stringWithFormat:@"%@-%@-%@",year,month,day ];

    }];
    
    
    view.dateBlock = ^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day) {
        
        
        self.datestr = [NSString stringWithFormat:@"%@-%@-%@",year,month,day ];
        
        
    };
    
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        self->_date.text = self->_datestr;
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
    }];
    
    [dilog setButtonBackgroundColor:navBar_color];
    [dilog setButtonTitleAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:14]}];
    
    
    [dilog showWithAnimated:YES completion:^(BOOL finished) {
        
    }];
    
}


-(void)edit:(UIButton*)button{
    
    

    
    if (self.isEdit == NO) {
        [self.button_right setTitle:@"保存" forState:UIControlStateNormal];
        self.isEdit = YES;
        self.title_tap.enabled = YES;
        self.catory_tap.enabled = YES;
        self.date_tap.enabled = YES;
        self.noteTextview.userInteractionEnabled = YES;
        
        
       
        
        
        

    }else{
        [self.button_right setTitle:@"编辑" forState:UIControlStateNormal];
        self.isEdit = NO;
        self.title_tap.enabled = NO;
        self.catory_tap.enabled = NO;
        self.date_tap.enabled = NO;
        self.noteTextview.userInteractionEnabled = NO;

        
       
        
        self.timeEntity.cateray = self.catory.text;
        
        self.timeEntity.title  = self.tittle.text;
        
        self.timeEntity.date  = self.date.text;
        
        self.timeEntity.note = self.noteTextview.text;
        
        self.timeEntity.dater = [TimeDatemater getNowTimeWithDommater];



        
        if ([[MKCoreDataManager shareManager]saveContext]) {
            
            // [self.navigationController popViewControllerAnimated:YES];
            
        }
        
    }
    
   
}
@end
