//
//  QuizViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 10/29/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizViewController.h"

@implementation QuizViewController
{
    NSArray *tableData;
}
@synthesize brain = _brain;


-(QuizBrain *) brain
{
    if(!_brain) _brain = [[QuizBrain alloc] init];
    return _brain;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    tableData = [self.brain getQuizes].quizes;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    //[self.table setDataSource:[self.brain getQuizes].quizes];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

@end
