//
//  SimpleViewController.m
//  UseCollectionView
//
//  Created by 刘隆昌 on 15-1-6.
//  Copyright (c) 2015年 刘隆昌. All rights reserved.
//

#import "SimpleViewController.h"

@interface SimpleViewController ()


@property(nonatomic,strong)NSArray * dataArray;

@end

@implementation SimpleViewController


-(void)loadView{
    self.view = [[[NSBundle mainBundle] loadNibNamed:@"SimpleViewController" owner:self options:nil] lastObject];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray * firstSection = [[NSMutableArray alloc]init];
    NSMutableArray * secondSection = [[NSMutableArray alloc]init];
    for (int i=0; i<50; i++) {
        
        [firstSection addObject:[NSString stringWithFormat:@"单元格 %d",i]];
        [secondSection addObject:[NSString stringWithFormat:@"数据项 %d",i]];
        
    }
    self.dataArray = [[NSArray alloc]initWithObjects:firstSection,secondSection,nil];
    
    UINib * cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    [self.CollectionView registerNib:cellNib forCellWithReuseIdentifier:@"ID"];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(2,2,2,2);
    [self.CollectionView setCollectionViewLayout:flowLayout];
    
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray * data = [self.dataArray objectAtIndex:indexPath.section];
    NSString * cellData = [data objectAtIndex:indexPath.row];
    static NSString * cellID = @"ID";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UILabel * titleLabel = (UILabel*)[cell viewWithTag:10];
    titleLabel.text = cellData;
    
    return cell;
    
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSMutableArray * sectionArray = [self.dataArray objectAtIndex:section];
    return [sectionArray count];
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
