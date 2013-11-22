//
//  QuizViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 10/22/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginBrain.h"

@interface LoginViewController ()
@property (nonatomic,strong) LoginBrain *brain;
@end

@implementation LoginViewController

@synthesize brain = _brain;

- (LoginBrain *) brain
{
    if(!_brain) _brain = [[LoginBrain alloc] init];
    return _brain;
}

- (IBAction)loginPressed:(id)sender
{
    if([self.brain authenticate:self.txtUsername.text :self.txtPassword.text])
    {
        [self lblStatus].text = @"Success!";
        [self lblStatus].textColor = [UIColor greenColor];
        if([self.brain isTeacher])
            [self performSegueWithIdentifier:@"createQuizSegue" sender:self];
        else
            [self performSegueWithIdentifier:@"LoginSuccess" sender:self];
    }
    else
    {
        [self lblStatus].text = @"Failure!";
        [self lblStatus].textColor = [UIColor redColor];
    }
}

@end
