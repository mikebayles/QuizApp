//
//  UserSettingsController.h
//  QuizClient
//
//  Created by Mike Bayles on 10/27/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileBrain.h"

@interface UserSettingsController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastsName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblPasswordMatch;
- (IBAction)btnSubmit:(id)sender;
@property (nonatomic,strong) ProfileBrain *brain;
@end
