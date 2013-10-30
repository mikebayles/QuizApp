//
//  ProfileBrain.h
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface ProfileBrain : NSObject
@property (nonatomic,strong) Profile* profile;
-(void) updateProfile;
@end
