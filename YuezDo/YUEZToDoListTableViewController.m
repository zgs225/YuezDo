//
//  YUEZToDoListTableViewController.m
//  YuezDo
//
//  Created by Yuez on 14-7-9.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "YUEZToDoListTableViewController.h"
#import "YUEZAddToDoItemViewController.h"
#import "YUEZAppDelegate.h"
#import "ToDoItem.h"

@interface YUEZToDoListTableViewController ()

@property (nonatomic, strong) NSArray *toDoItems;
@property (nonatomic, strong) YUEZAppDelegate *appDelegate;

@end

@implementation YUEZToDoListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.toDoItems = [self.appDelegate getAllToDoItems];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoItemPrototype" forIndexPath:indexPath];
    ToDoItem *item = [self.toDoItems objectAtIndex:[indexPath row]];
    cell.textLabel.text = item.itemName;
    if ([item.completed isEqualToNumber:@1])
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    if ([tappedItem.completed  isEqualToNumber:@0])
        tappedItem.completed = @1;
    else
        tappedItem.completed = @0;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    YUEZAddToDoItemViewController *source = [segue sourceViewController];
    if(source.toDoItem != nil)
    {
        self.toDoItems = [self.appDelegate getAllToDoItems];
        [self.tableView reloadData];
    }
}

@end
