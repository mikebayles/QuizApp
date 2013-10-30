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
@synthesize lblPasswordMatch = _lblPasswordMatch;

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
    [self.view endEditing:YES];
    self.brain.profile.firstname = self.txtFirstName.text;
    self.brain.profile.lastname = self.txtLastsName.text;
    self.brain.profile.email = self.txtEmail.text;
    
    NSString* password1 = self.txtPassword.text;
    NSString* password2 = self.txtConfirmPassword.text;
    if([password1 length] > 0)
    {
        if([password1 isEqualToString:password2])
        {
            self.lblPasswordMatch.text = @"Passwords Match!";
            self.lblPasswordMatch.textColor = [UIColor greenColor];
            self.brain.profile.auth.password = password1;
            [self updateProfile];
        }
        else
        {
            self.lblPasswordMatch.text = @"Passwords Do Not Match";
            self.lblPasswordMatch.textColor = [UIColor redColor];
        }
    }
    else
    {
        [self updateProfile];
    }
    [self refreshTextfields];
    
}

-(void) refreshTextfields
{
    self.txtFirstName.text = self.brain.profile.firstname;
    self.txtLastsName.text = self.brain.profile.lastname;
    self.txtEmail.text = self.brain.profile.email;
}

-(void) updateProfile
{
    if([self.brain updateProfile])
    {
        self.lblPasswordMatch.text = @"Update Successful!";
        self.lblPasswordMatch.textColor = [UIColor greenColor];
    }
    else
    {
        self.lblPasswordMatch.text = @"Update Failed";
        self.lblPasswordMatch.textColor = [UIColor redColor];
    }
}
@end
