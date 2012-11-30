//
//  RDFQueryViewController.m
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import "RDFQueryViewController.h"

@interface RDFQueryViewController () {

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [formatNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"query";
    
    UITableViewCell *cell = (UITableViewCell *)
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [formatNames objectAtIndex:indexPath.row];
    return cell;
}

@end
