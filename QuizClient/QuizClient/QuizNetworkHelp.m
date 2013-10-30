//
//  QuizNetworkHelp.m
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizNetworkHelp.h"

@implementation QuizNetworkHelp

+ (NSString *) makePostRequest: (NSString *)message withServlet:(NSString *)servlet
{
    NSString *url = [NSString stringWithFormat:@"http://localhost:8080/QuizServerTomcat/%@",servlet];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[message dataUsingEncoding:NSUTF8StringEncoding]];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    
    NSString* ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return ret;
}
@end
