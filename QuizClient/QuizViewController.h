//
//  QuizViewController.h
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizBrain.h"


@interface QuizViewController : UIViewController
@property (nonatomic,strong) QuizBrain *brain;

@end
