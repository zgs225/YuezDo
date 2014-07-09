//
//  YUEZAddToDoItemViewController.m
//  YuezDo
//
//  Created by Yuez on 14-7-9.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "YUEZAddToDoItemViewController.h"
#import "ToDoItem.h"
#import "YUEZAppDelegate.h"

@interface YUEZAddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation YUEZAddToDoItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    YUEZAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext    = appDelegate.managedObjectContext;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if ([[[self textField] text] length] > 0)
    {
        self.toDoItem = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem"
                                                      inManagedObjectContext:self.managedObjectContext];
        self.toDoItem.itemName  = self.textField.text;
        self.toDoItem.completed = NO;
        NSError *error;
        if (![self.managedObjectContext save:&error])
        {
            NSLog(@"Whoops! Can't save: %@", [error localizedDescription]);
        }
    }
}

@end
