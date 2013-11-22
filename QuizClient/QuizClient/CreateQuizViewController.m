//
//  CreateQuizViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 11/21/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "CreateQuizViewController.h"

@interface CreateQuizViewController ()

@end

@implementation CreateQuizViewController
@synthesize txtQuestion = _txtQuestion;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.txtQuestion.layer.borderWidth = 1.0f;
    [self.txtQuestion becomeFirstResponder];
}


@end
