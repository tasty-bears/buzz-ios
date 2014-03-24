//
//  Event.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "Event.h"

@implementation Event

//init with a dictionary of user properties
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _name = [jsonDictionary objectForKey:@"name"];
        _description = [jsonDictionary objectForKey:@"description"];
        _isPrivate = [jsonDictionary[@"isPrivate"] boolValue];;
        _date = [jsonDictionary objectForKey:@"date"];
        _duration = [jsonDictionary objectForKey:@"duration"];
        _locationDescription = [jsonDictionary objectForKey:@"locationDescription"];
        _longitude = [jsonDictionary objectForKey:@"locationLong"];
        _latitude = [jsonDictionary objectForKey:@"locationLat"];
        _scheduleId = [jsonDictionary objectForKey:@"scheduleId"];
        _eventId = [jsonDictionary objectForKey:@"id"];
    }
    
    return self;
}

@end
