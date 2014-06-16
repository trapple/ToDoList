//
//  AddItemViewController.h
//  ToDoList
//
//  Created by Sachiko Murai on 2014/05/28.
//  Copyright (c) 2014年 Sachiko Murai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddItemViewControllerDelegate;
@interface AddItemViewController : UITableViewController
@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;

@end

@protocol AddItemViewControllerDelegate <NSObject>
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item;

@end
