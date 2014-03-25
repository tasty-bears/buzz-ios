//
//  Course.h
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Course : NSObject
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *name;
@property (readonly) NSNumber *courseNumber;
@property (readonly) NSNumber *section;
@property (readonly) NSString *professor;
@property (readonly) NSString *courseId;

@end
