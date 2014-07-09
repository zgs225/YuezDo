//
//  YUEZAppDelegate.h
//  YuezDo
//
//  Created by Yuez on 14-7-9.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUEZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Core data management objects
@property (readonly, retain, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, retain, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, retain, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSArray *)getAllToDoItems;

@end
