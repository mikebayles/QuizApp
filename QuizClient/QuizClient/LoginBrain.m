//
//  LoginBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "LoginBrain.h"
#import "Auth.h"

@implementation LoginBrain

-(BOOL) authenticate: (NSString*)username :(NSString*) password
{
    Auth* auth = [[Auth alloc]init];
    auth.username = username;
    auth.password = password;
    
    // Create socket pair:
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStringRef remoteHost = CFSTR("localhost");
    CFStreamCreatePairWithSocketToHost(NULL, remoteHost, 9898, &readStream, &writeStream);
    
    // Write something (the socket is not valid before you read or write):
    CFWriteStreamOpen(writeStream);
    NSString* message = [NSString stringWithFormat:@"authorize\n%@\n",[auth toJSONString]];
    
    CFWriteStreamWrite(writeStream, (const UInt8 *)[message UTF8String], [message length]);
    
    return true;
}

@end
