//
//  User.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "User.h"

@implementation User

//init with a dictionary of user properties
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _username = [jsonDictionary objectForKey:@"username"];
        _familyName = [jsonDictionary objectForKey:@"familyName"];
        _givenName = [jsonDictionary objectForKey:@"givenName"];
        _email = [jsonDictionary objectForKey:@"email"];
        _userId = [jsonDictionary objectForKey:@"id"];
    }
    
    return self;
}

@end
