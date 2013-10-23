//
//  QuizViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizViewController.h"
#import "LoginBrain.h"

@interface QuizViewController ()
@property (nonatomic,strong) LoginBrain *brain;
@end

@implementation QuizViewController

@synthesize brain = _brain;

- (LoginBrain *) brain
{
    if(!_brain) _brain = [[LoginBrain alloc] init];
    return _brain;
}

- (IBAction)loginPressed:(id)sender
{
    [self.brain authenticate:self.txtUsername.text :self.txtPassword.text];
}

@end
