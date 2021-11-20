//
//  bingtangxueliView.m
//  DMinutes
//
//  Created by MoMo on 2019/5/20.
//  Copyright © 2019 DM. All rights reserved.
//

#import "bingtangxueliView.h"

@implementation bingtangxueliView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    
    
    
    

}


-(void)selectCatoryIndexPathWithName:(NSString*)name withBlock:(CatoryBlock)catoryBlock{

    if ([name isEqualToString:@"生活"]) {
        self.indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }else if ([name isEqualToString:@"工作"]){
        
        self.indexPath = [NSIndexPath indexPathForRow:1 inSection:0];

    }else if ([name isEqualToString:@"学习"]){
        
        self.indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        
    }else if ([name isEqualToString:@"纪念日"]){
        
        self.indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
        
    }else if ([name isEqualToString:@"其它"]){
        
        self.indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
        
    }
    
    catoryBlock(name);
    
    [self.CatoryTableview reloadData];

}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.array =@[@"生活",@"工作",@"学习",@"纪念日",@"其它"];
       
        
        self.CatoryTableview=[[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        
        [self.CatoryTableview registerNib:[UINib nibWithNibName:@"nongfushanquanCell" bundle:nil] forCellReuseIdentifier:@"CatoryCell"];
        self.CatoryTableview.tableFooterView =[UIView new];
        self.CatoryTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        self.CatoryTableview.delegate=self;
        self.CatoryTableview.dataSource=self;
        [self addSubview:self.CatoryTableview];
        
       
        
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    nongfushanquanCell *cell =   [tableView dequeueReusableCellWithIdentifier:@"CatoryCell" forIndexPath:indexPath];
    
    
    if (!cell) {
        
        cell = [[nongfushanquanCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CatoryCell"];
    }
    
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    cell.title.text =[self.array objectAtIndex:indexPath.row];
    
    if(indexPath==_indexPath){
        
        cell.img.hidden =NO;
        
    }else{
        
        cell.img.hidden =YES;

        
    }
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 30;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    nongfushanquanCell * oldcell = [tableView cellForRowAtIndexPath:_indexPath];
    
    oldcell.img.hidden =YES;
    
    
    _indexPath =indexPath;
    
    nongfushanquanCell * newcell = [tableView cellForRowAtIndexPath:indexPath];
    
    newcell.img.hidden =NO;
    
    
    self.catoryBlock([self.array objectAtIndex:indexPath.row]);
}



@end
