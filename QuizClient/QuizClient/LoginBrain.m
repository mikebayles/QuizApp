//
//  LoginBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "LoginBrain.h"
#import "Auth.h"
#import "QuizNetworkHelp.h"

@implementation LoginBrain

-(BOOL) authenticate: (NSString*)username :(NSString*) password
{
    Auth* auth = [[Auth alloc]init];
    auth.username = username;
    auth.password = password;
    
    NSString* message = [NSString stringWithFormat:@"json=%@",[auth toJSONString]];
    
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet: @"LoginServlet"];
    
    return [response isEqualToString:@"TRUE"];
}

@end
