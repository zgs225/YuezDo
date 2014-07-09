//
//  ToDoItem.h
//  YuezDo
//
//  Created by Yuez on 14-7-9.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDoItem : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSDate * completedDate;

@end
