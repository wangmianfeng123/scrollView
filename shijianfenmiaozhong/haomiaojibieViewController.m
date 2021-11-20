//
//  haomiaojibieViewController.m
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import "haomiaojibieViewController.h"
@interface haomiaojibieViewController (){
    
    UITextField * _title_Textfiled;
    
}
@property (weak, nonatomic) IBOutlet UILabel *title_label;
@property (weak, nonatomic) IBOutlet UILabel *catoary;
@property (weak, nonatomic) IBOutlet UILabel *date_label;

@property (weak, nonatomic) IBOutlet QMUITextView *noteTextView;

@property (nonatomic,strong)NSString  * date;
@property (nonatomic,strong)NSString  * catoryName;

@end

@implementation haomiaojibieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];
	self.noteTextView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
	self.noteTextView.placeholder = @"输入备注信息";
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	
	[_title_Textfiled resignFirstResponder];
	
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
	if ([text isEqualToString:@"\n"]){
	
		
		[self.noteTextView resignFirstResponder];
		
		return NO;
	}
	
	return YES;
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
	
	_title_Textfiled.textAlignment = NSTextAlignmentCenter;
	
	_title_Textfiled.placeholder = @"输入标题";
	
    [view addSubview:_title_Textfiled];
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
			
			
			
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        self->_title_label.text = self->_title_Textfiled.text;
        
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
    
    view.catoryBlock = ^(NSString *CatoryName) {
        self->_catoryName = CatoryName;
    };
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        
        self->_catoary.text = self->_catoryName;
        
        
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
    
	yuanfangPicker * view =[[yuanfangPicker alloc]initWithFrame:CGRectMake(0, 0,300, 100) withDate:nil dateBlock:^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day) {
		
		self->_date = [NSString stringWithFormat:@"%@-%@-%@",year,month,day ];
		
	}];
	view.dateBlock = ^(NSString * _Nonnull year, NSString * _Nonnull month, NSString * _Nonnull day) {
		
		
		self->_date = [NSString stringWithFormat:@"%@-%@-%@",year,month,day ];

		
		
	};
	
    
    [dilog setContentView:view];
    
    [dilog addCancelButtonWithText:@"取消" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
        [aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
            
        }];
        
    }];
    
    
    [dilog addSubmitButtonWithText:@"确定" block:^(__kindof QMUIDialogViewController *aDialogViewController) {
        
		self->_date_label.text = self->_date;
		
		[aDialogViewController hideWithAnimated:YES completion:^(BOOL finished) {
			
		}];
    }];
    
    [dilog setButtonBackgroundColor:navBar_color];
    [dilog setButtonTitleAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:14]}];
    
    
    [dilog showWithAnimated:YES completion:^(BOOL finished) {
        
    }];
    
}





- (IBAction)save:(id)sender {
    
	TimeEntity*timeEntity =[NSEntityDescription insertNewObjectForEntityForName:@"TimeEntity" inManagedObjectContext:[MKCoreDataManager shareManager].managedObjectContext];
	
	timeEntity.cateray = self.catoary.text;
	
	timeEntity.title  = self.title_label.text;
	
	timeEntity.date  = self.date;
	
	timeEntity.note = self.noteTextView.text;
	
	timeEntity.dater = [TimeDatemater getNowTimeWithDommater];
	
	
	
	if ([[MKCoreDataManager shareManager]saveContext]) {
		
		[self.navigationController popViewControllerAnimated:YES];
		
	}
	
	
}



@end
