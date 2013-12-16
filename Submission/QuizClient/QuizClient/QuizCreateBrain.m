//
//  QuizCreateBrain.m
//  QuizClient
//
//  Created by Mike Bayles on 12/9/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizCreateBrain.h"
#import "QuizNetworkHelp.h"

@implementation QuizCreateBrain
-(BOOL) createQuiz: (Quiz*) quiz
{
    
    NSString* message = [NSString stringWithFormat:@"method=createQuiz&json=%@",[quiz toJSONString]];
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"CreateServlet"];
    NSLog(@"Respone = %@",response);
    
    return [response isEqualToString:@"true"];
}
@end
