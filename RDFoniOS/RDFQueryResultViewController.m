//
//  RDFQueryResultViewController.m
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import "RDFQueryResultViewController.h"
#import "RDFQueryViewController.h"

@interface RDFQueryResultViewController ()
{
}

@end

@implementation RDFQueryResultViewController

@synthesize queryText = queryText;

- (void)viewDidLoad
{
    if (queryText.length > 0) {
        [self.textView setText:queryText];
    } else {
        [self.textView setText:@"Format not supported for data."];
    }
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
