//
//  DetailViewController.h
//  ToDoList
//
//  Created by Sachiko Murai on 2014/05/28.
//  Copyright (c) 2014年 Sachiko Murai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
