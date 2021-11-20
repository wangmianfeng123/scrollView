//
//  lvsedetuobaViewController.m
//  DMinutes
//
//  Created by MoMo on 2019/5/17.
//  Copyright © 2019 DM. All rights reserved.
//

#import "lvsedetuobaViewController.h"

@implementation lvsedetuobaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];
}


- (IBAction)delete:(id)sender {
    
    NSArray * arr = [[MKCoreDataManager shareManager].managedObjectContext executeFetchRequest:[TimeEntity fetchRequest] error:nil];
    
    for (TimeEntity * timeEntity in arr) {
        
        [[MKCoreDataManager shareManager].managedObjectContext deleteObject:timeEntity];
    }
    
    
    [[MKCoreDataManager shareManager]saveContext];
}



@end
