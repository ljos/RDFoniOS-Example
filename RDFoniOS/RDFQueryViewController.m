//
//  RDFQueryViewController.m
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import "RDFQueryViewController.h"
#import "RDFQueryResultViewController.h"
#import "RDFSparqlQueryViewController.h"

@interface RDFQueryViewController ()
{
}

@end

@implementation RDFQueryViewController

- (void)viewDidLoad
{
    formatNames = [[NSArray alloc] initWithObjects:@"ntriples", @"turtle",
                   @"rdfxml-xmp", @"rdfxml-abbrev", @"rdfxml", @"rss-1.0",
                   @"atom", @"dot", @"json-triples", @"json", @"html",
                   @"nquads", nil];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"mammals"
                                                     ofType:@"ttl"];
    
    data = [[RDFData alloc] initWithFile:file
                               uriString:@"http://example.org#"];
    
    NSString* queryString =
        @"SELECT ?entity "
         "WHERE { "
         "  ?entity <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?type. "
         "  ?type <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> "
         "        <http://www.w3.org/2002/07/owl#Class> "
         "}";

    queryResults = [data queryModelWithSPARQLQuery:queryString];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [formatNames count];
            break;
        case 1:
            return 1;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0:
            CellIdentifier = @"query";

            cell = (UITableViewCell *)
            [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:CellIdentifier];
            }
            
            cell.textLabel.text = [formatNames objectAtIndex:indexPath.row];
            return cell;
            break;
        case 1:
            CellIdentifier = @"sparql";

            cell = (UITableViewCell *)
            [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:CellIdentifier];
            }

            return cell;
            break;
        default:
            return nil;
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier = [segue identifier];
    if([identifier isEqualToString:@"toQuery"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *formatName = [formatNames objectAtIndex:indexPath.row];
    
        RDFQueryResultViewController *queryResultViewController =
            [segue destinationViewController];
        [queryResultViewController setTitle:formatName];

        NSString *text = [queryResults stringRepresentationWithName:formatName
                                                            baseURI:nil];
        [queryResultViewController setQueryText:text];
        
    } else if ([identifier isEqualToString:@"toSparql"]) {
        RDFSparqlQueryViewController *sparqlQueryViewController =
            [segue destinationViewController];
        [sparqlQueryViewController setData:data];
    }
}

@end
