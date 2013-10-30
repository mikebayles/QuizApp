//
//  UserSettingsController.m
//  QuizClient
//
//  Created by Mike Bayles on 10/27/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "UserSettingsController.h"
#import "QuizNetworkHelp.h"


@implementation UserSettingsController

@synthesize brain = _brain;
@synthesize txtFirstName = _txtFirstName;
@synthesize txtLastsName = _txtLastsName;
@synthesize txtEmail = _txtEmail;
@synthesize txtPassword = _txtPassword;
@synthesize txtConfirmPassword = _txtConfirmPassword;

- (ProfileBrain *) brain
{
    if(!_brain) _brain = [[ProfileBrain alloc] init];
    return _brain;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self refreshTextfields];
}

- (IBAction)btnSubmit:(id)sender
{
    self.brain.profile.firstname = self.txtFirstName.text;
    self.brain.profile.lastname = self.txtLastsName.text;
    self.brain.profile.email = self.txtEmail.text;
    
    [self.brain updateProfile];
    [self refreshTextfields];
    
}

-(void) refreshTextfields
{
    self.txtFirstName.text = self.brain.profile.firstname;
    self.txtLastsName.text = self.brain.profile.lastname;
    self.txtEmail.text = self.brain.profile.email;
}
@end
