//
//  Course.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
@protocol Course @end
@interface Course : JSONModel
@property NSString* id;
@property NSString* description;
@end
