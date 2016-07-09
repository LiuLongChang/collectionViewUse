//
//  SimpleViewController.h
//  UseCollectionView
//
//  Created by 刘隆昌 on 15-1-6.
//  Copyright (c) 2015年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>





@property (strong, nonatomic) IBOutlet UICollectionView *CollectionView;












@end
