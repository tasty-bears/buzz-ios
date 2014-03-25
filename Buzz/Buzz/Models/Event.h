//
//  Event.h
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *name;
@property (readonly) NSString *description;
@property (readonly) BOOL isPrivate;
@property (readonly) NSDate *date;
@property (readonly) NSNumber *duration;
@property (readonly) NSString *locationDescription;
@property (readonly) NSNumber *longitude;
@property (readonly) NSNumber *latitude;
@property (readonly) NSString *scheduleId;
@property (readonly) NSString *eventId;

@end
