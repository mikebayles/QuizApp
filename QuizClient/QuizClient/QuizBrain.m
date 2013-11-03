//
//  QuizBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizBrain.h"
#import "QuizNetworkHelp.h"

@implementation QuizBrain
QuizCollection* quizes;

-(QuizCollection*) getQuizes
{
   if(quizes)
       return quizes;
    
    return [self refreshQuizes];
}

-(QuizCollection *) refreshQuizes
{
    NSString* message = [NSString stringWithFormat:@"method=get"];
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"QuizServlet"];
    
    NSError *err;
    
    return [[QuizCollection alloc] initWithString:response error: &err ];
}
@end
