//
//  RDFConnection.m
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import "RDFData.h"

@implementation RDFData

- (id)initWithFile:(NSString *)rdfPath
         uriString:(NSString *)uriString
{
    if (self = [super init])
    {
        NSString *rdfString = [[NSString alloc]
                               initWithContentsOfFile:rdfPath
                                             encoding:NSUTF8StringEncoding
                                                error:nil];
        
        parser = [RedlandParser parserWithName:RedlandTurtleParserName];
        RedlandURI *uri = [RedlandURI URIWithString:uriString];
        model = [RedlandModel new];
        
        [parser parseString:rdfString intoModel:model withBaseURI:uri];
    }
    
    return self;
}

- (RedlandParser *)parser
{
    return parser;
}

- (RedlandModel *)model
{
    return model;
}

- (RedlandQueryResults *)queryModelWithQuery:(NSString *)query
                               queryLanguage:(NSString *)queryLanguage
{
    RedlandQuery *rquery;
    RedlandQueryResults *results;
   
    rquery = [RedlandQuery queryWithLanguageName:RedlandSPARQLLanguageName
                                     queryString:query
                                         baseURI:nil];
    results = [rquery executeOnModel:model];
    return results;
}

-(RedlandQueryResults *)queryModelWithSPARQLQuery:(NSString *)query
{
    return [self queryModelWithQuery:query
                       queryLanguage:RedlandSPARQLLanguageName];
}

-(NSString *)queryModelReturnStringWithSPARQLQuery:(NSString *)query
                                   withNamedFormat:(NSString *)formatName
                                           baseURI:(RedlandURI *)baseURI
{
    RedlandQueryResults *results =
        [self queryModelWithQuery:query
                    queryLanguage:RedlandSPARQLLanguageName];
    NSString *ret = [results stringRepresentationWithName:formatName
                                                  baseURI:baseURI];
    return ret;
}



@end
