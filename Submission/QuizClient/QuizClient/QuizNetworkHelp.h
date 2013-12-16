//
//  QuizNetworkHelp.h
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizNetworkHelp : NSObject
+ (NSString *) makePostRequest: (NSString *)message withServlet:(NSString *)servlet;
@end
