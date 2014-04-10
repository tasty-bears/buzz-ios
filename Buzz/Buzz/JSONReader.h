//
//  JSONReader.h
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Models/User.h"
#import "Models/Course.h"
#import "Models/Event.h"
#import "Models/Schedule.h"
#import "Models/Enrollment.h"

@interface JSONReader : NSObject

- (User *)getUserFromJSONFile:(NSURL *)url;
- (NSArray *)getCoursesFromJSONFile:(NSURL *)url forUserId:(NSString *)userId;
- (NSArray *)getEventsFromJSONFile:(NSURL *)url forCourseId:(NSString *)courseId;

@end
