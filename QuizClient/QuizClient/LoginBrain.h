//
//  LoginBrain.h
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginBrain : NSObject
-(BOOL) authenticate: (NSString*)username :(NSString*) password;
-(BOOL) isTeacher;
@end
