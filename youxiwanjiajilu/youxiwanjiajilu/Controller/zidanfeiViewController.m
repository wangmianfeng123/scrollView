

//
//  zidanfeiViewController.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/23.
//  Copyright © 2019 paien. All rights reserved.
//

#import "zidanfeiViewController.h"

@interface zidanfeiViewController ()
@property (weak, nonatomic) IBOutlet QMUITextView *feedback_textView;

@end

@implementation zidanfeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //self.feedback_textView.placeholder = @"Please give us your feedback";
}
- (IBAction)confirm:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
