//
//  RDFSparqlQueryViewController.m
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import "RDFSparqlQueryViewController.h"
#import "RDFQueryResultViewController.h"
#import <Redland.h>


@interface RDFSparqlQueryViewController ()
{
}

@end

@implementation RDFSparqlQueryViewController
@synthesize data = data;
@synthesize textView = textView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *queryString = [textView text];
    RedlandQueryResults *queryResults;
    @try
    {
        queryResults = [data queryModelWithSPARQLQuery:queryString];
    }
    @catch (RedlandException *e)
    {
        NSLog(@"Exception: %@", e);
    }
    RDFQueryResultViewController *queryResultViewController = [segue destinationViewController];
    NSString *resultString = [queryResults stringRepresentationWithName:@"rdfxml"
                                                          baseURI:nil];
    [queryResultViewController setQueryText:resultString];
}

@end
