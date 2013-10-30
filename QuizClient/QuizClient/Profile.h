//
//  Profile.h
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Profile : JSONModel

@property NSString *username;
@property NSString *password;
@property NSString *firstname;
@property NSString *lastname;
@property NSString *email;
@property bool isTeacher;

@end
