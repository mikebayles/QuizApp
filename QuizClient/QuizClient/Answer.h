//
//  Answer.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
@protocol Answer @end
@interface Answer : JSONModel
@property NSInteger id;
@property NSString * text;
@property bool correct;
@end
