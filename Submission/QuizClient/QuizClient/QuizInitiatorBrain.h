//
//  QuizInitiatorBrain.h
//  QuizClient
//
//  Created by Mike Bayles on 12/8/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CourseCollection.h"


@interface QuizInitiatorBrain : NSObject
-(CourseCollection*) getCourses;
@end
