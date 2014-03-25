//
//  Schedule.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule

//init with a dictionary of user properties
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _name = [jsonDictionary objectForKey:@"name"];
        _courseId = [jsonDictionary objectForKey:@"courseId"];
        _scheduleId = [jsonDictionary objectForKey:@"id"];
    }
    
    return self;
}


@end
