//
//  ProfileBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "ProfileBrain.h"
#import "QuizNetworkHelp.h"


@implementation ProfileBrain
@synthesize profile = _profile;
-(Profile *) profile
{
    if(! _profile) _profile = [self refreshProfile];
    return _profile;
}

-(Profile *) refreshProfile
{
    NSString* response = [QuizNetworkHelp makePostRequest:@"method=get" withServlet:@"ProfileServlet"];
    NSError *err;
    return [[Profile alloc] initWithString:response error:&err];
}

-(void) updateProfile
{
    NSString* message = [NSString stringWithFormat:@"method=update&json=%@",[self.profile toJSONString]];
    
    [QuizNetworkHelp makePostRequest:message withServlet:@"ProfileServlet"];
}

@end
