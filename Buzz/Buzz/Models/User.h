//
//  User.h
//  Buzz
//
//  Created by Trevor Poppen on 3/24/14.
//  Copyright (c) 2014 Tasty Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (readonly) NSString *username;
@property (readonly) NSString *familyName;
@property (readonly) NSString *givenName;
@property (readonly) NSString *email;
@property (readonly) NSString *userId;

@end
