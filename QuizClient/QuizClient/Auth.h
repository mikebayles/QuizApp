//
//  Auth.h
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Auth : JSONModel

@property NSString *username;
@property NSString *password;

@end
