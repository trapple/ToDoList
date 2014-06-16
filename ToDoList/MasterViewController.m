//
//  MasterViewController.m
//  ToDoList
//
//  Created by Sachiko Murai on 2014/05/28.
//  Copyright (c) 2014年 Sachiko Murai. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "AddItemViewController.h"

@interface MasterViewController ()  <AddItemViewControllerDelegate>
{
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller
{
    NSLog(@"addItemViewControllerDidCancel");
    
    //画面を閉じるを呼ぶ
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)addItemViewControllerDidFinish:(AddItemViewController *)controller item:(NSString *)item
{
    NSLog(@"addItemViewControllerDidFinish item:%@",item);
    
    //保存するための配列がなければ作成
    if (!_objects){
        _objects = [[NSMutableArray alloc] init];
    }
    
    //受け取ったitemを配列へ
    [_objects insertObject:item atIndex:0];
    
    //tableViewに行を挿入
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //画面を閉じる
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowAddItemView"]) {
        
        // 遷移先のAddItemViewControllerのインスタンスを取得
        AddItemViewController *addItemViewController = (AddItemViewController *)[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        // delegateプロパティに self(MasterViewController自身)をセット
        addItemViewController.delegate = self;
        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
    }
}

- (IBAction)unwindToMaster:(UIStoryboardSegue *)segue
{
    NSLog(@"unwind");
}


@end
