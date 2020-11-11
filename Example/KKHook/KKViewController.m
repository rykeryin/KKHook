//
//  KKViewController.m
//  KKHook
//
//  Created by rykeryin on 11/10/2020.
//  Copyright (c) 2020 rykeryin. All rights reserved.
//

#import "KKViewController.h"

@interface KKViewController ()

@end

@implementation KKViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!fopen("", "")) {
        printf("Open file failed!");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
