//
//  Enrollment.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "Enrollment.h"

@implementation Enrollment

//init with a dictionary of user properties
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _courseId = [jsonDictionary objectForKey:@"courseId"];
        _userId = [jsonDictionary objectForKey:@"userId"];
        _enrollmentId = [jsonDictionary objectForKey:@"id"];
    }
    
    return self;
}

@end
