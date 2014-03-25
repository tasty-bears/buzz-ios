//
//  Schedule.h
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *name;
@property (readonly) NSString *courseId;
@property (readonly) NSString *scheduleId;

@end
