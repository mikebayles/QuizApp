//
//  Quiz.m
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz
@synthesize description;
@synthesize course;

-(NSString *) toString
{
    return [NSString stringWithFormat:@"%@ - %@",self.course.id, self.description];
}
@end
