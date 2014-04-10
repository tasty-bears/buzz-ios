//
//  JSONReader.m
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import "JSONReader.h"


@implementation JSONReader

//will be implemented differently when the authentication is implemented
- (User *)getUserFromJSONFile:(NSURL *)url{

    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    // Get a dictionary of dictionaries with the key "users"
    NSDictionary *userDict = [jsonDictionary objectForKey:@"User"];
    
    NSMutableArray *userObjects = [[NSMutableArray alloc] init];

    // Iterate through the dictionary of dictionaries
    for(NSDictionary *dict in userDict) {
        // Create a new user object for each one and initialise it with information in the dictionary
        User *myUser = [[User alloc] initWithJSONDictionary:dict];
        // Add the user object to the array
        [userObjects addObject:myUser];
    }
    
    // Return the first user
    return userObjects[0];
}

- (NSArray *)getCoursesFromJSONFile:(NSURL *)url forUserId:(NSString *)userId{

    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    // Get a dict of dictionaries with the key "Course"
    NSDictionary *courseDict = [jsonDictionary objectForKey:@"Course"];
    
    NSMutableArray *courseObjects = [[NSMutableArray alloc] init];
    NSMutableArray *usersCourses = [[NSMutableArray alloc] init];
    
    // Iterate through the dictionary of dictionaries
    for(NSDictionary *dict in courseDict) {
        // Create a new course object for each one and initialise it with information in the dictionary
        Course *myCourse = [[Course alloc] initWithJSONDictionary:dict];
        // Add the course object to the array
        [courseObjects addObject:myCourse];
    }
    
    NSArray *enrollments = [self getEnrollmentsFromJSONFile:url];
    
    for (Enrollment *enrollment in enrollments){
        if (enrollment.userId == userId) {
            for (Course *myCourse in courseObjects) {
                if (myCourse.courseId == enrollment.courseId) {
                    [usersCourses addObject:myCourse];
                }
            }
        }
    }
    
    // Return the array of course objects
    return usersCourses;
}

- (NSArray *)getEventsFromJSONFile:(NSURL *)url forCourseId:(NSString *)courseId{
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    // Get a dictionary of dictionaries with the key "users"
    NSDictionary *eventsDict = [jsonDictionary objectForKey:@"Event"];
    
    NSMutableArray *eventObjects = [[NSMutableArray alloc] init];
    NSMutableArray *courseEvents = [[NSMutableArray alloc] init];
    
    // Iterate through the dictionary of dictionaries
    for(NSDictionary *dict in eventsDict) {
        // Create a new event object for each one and initialise it with information in the dictionary
        Event *myEvent = [[Event alloc] initWithJSONDictionary:dict];
        // Add the event object to the array
        [eventObjects addObject:myEvent];
    }
    
    Schedule *mySchedule = [self getScheduleFromJSONFile:url forCourseId:courseId];
    
    for (Event *myEvent in eventObjects){
        if (myEvent.scheduleId == mySchedule.scheduleId) {
            [courseEvents addObject:myEvent];
        }
    }
    // Return the corresponding events,
    return courseEvents;
}

- (Schedule *)getScheduleFromJSONFile:(NSURL *)url forCourseId:(NSString *)courseId{
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    // Get a dictionary of dictionaries with the key "users"
    NSDictionary *scheduleDict = [jsonDictionary objectForKey:@"Schedule"];
    
    //find the corresponding schedule
    for(NSDictionary *dict in scheduleDict) {
        // Create a new schedule object for each one and initialise it with information in the dictionary
        Schedule *mySchedule = [[Schedule alloc] initWithJSONDictionary:dict];
        if (mySchedule.courseId == courseId) {
            return mySchedule;
        }
    }
    
    // Return null if the schedule isn't found
    return NULL;

}

- (NSArray *)getEnrollmentsFromJSONFile:(NSURL *)url {
    // Create a NSURLRequest with the given URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                         timeoutInterval:30.0];
	
    // Get the data
    NSURLResponse *response;
	NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // Now create a NSDictionary from the JSON data
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    
    // Get a dictionary of dictionaries with the key "users"
    NSDictionary *enrollmentDict = [jsonDictionary objectForKey:@"Enrollment"];
    
    NSMutableArray *enrollmentObjects = [[NSMutableArray alloc] init];
    
    // Iterate through the dictionary of dictionaries
    for(NSDictionary *dict in enrollmentDict) {
        // Create a new enrollment object for each one and initialise it with information in the dictionary
        Enrollment *myEnrollment = [[Enrollment alloc] initWithJSONDictionary:dict];
        // Add the enrollment object to the array
        [enrollmentObjects addObject:myEnrollment];
    }
    
    // Return the array of enrollments
    return enrollmentObjects;

}


@end
