//
//  QuizInitiatorBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 12/8/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizInitiatorBrain.h"
#import "QuizNetworkHelp.h"

@implementation QuizInitiatorBrain

CourseCollection* courses;

-(CourseCollection*) getCourses
{
    if(courses)
        return courses;
    
    return [self refreshCourses];
}

-(CourseCollection*) refreshCourses
{
    
    NSString* message = [NSString stringWithFormat:@"method=getCourses"];
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"CreateServlet"];
    
    NSError *err;
    
    CourseCollection* ret = [[CourseCollection alloc] initWithString:response error: &err ];
    
    return ret;
}

@end
