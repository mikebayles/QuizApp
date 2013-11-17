//
//  QuizTakeViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizTakeViewController.h"
#import "QuizDataStore.h"


@implementation QuizTakeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"We have quizes ytes? %@",[[[QuizDataStore instance].quizes.quizes objectAtIndex:0] toString]);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"There is a shit ton of leakage");
    // Dispose of any resources that can be recreated.
}

@end
