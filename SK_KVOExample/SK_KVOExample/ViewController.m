//
//  ViewController.m
//  SK_KVOExample
//
//  Created by Saroj Sharma on 28/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain) IBOutlet SKIncrementalView *skIncrementalView;
@end

@implementation ViewController
@synthesize skIncrementalView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [skIncrementalView addObserver:skIncrementalView forKeyPath:@"percent" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)action:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
}

- (void)timerTick{
    NSInteger num=[skIncrementalView.percent integerValue];
    skIncrementalView.percent=[NSNumber numberWithInteger:num+1];
}

@end
