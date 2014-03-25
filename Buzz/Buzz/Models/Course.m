//
//  Course.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "Course.h"

@implementation Course

//init with a dictionary of user properties
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _name = [jsonDictionary objectForKey:@"name"];
        _courseNumber = [jsonDictionary objectForKey:@"courseNumber"];
        _section = [jsonDictionary objectForKey:@"section"];
        _professor = [jsonDictionary objectForKey:@"professor"];
        _courseId = [jsonDictionary objectForKey:@"id"];
    }
    
    return self;
}

@end
