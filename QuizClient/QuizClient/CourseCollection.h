//
//  CourseCollection.h
//  QuizClient
//
//  Created by Mike Bayles on 12/8/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "Course.h"

@interface CourseCollection : JSONModel
@property NSArray<Course, ConvertOnDemand>* courses;
@end
