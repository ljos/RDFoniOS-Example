//
//  RDFConnection.h
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Redland-ObjC.h>

@interface RDFData : NSObject
{
    RedlandParser *parser;
    RedlandModel *model;
}

- (id)initWithFile:(NSString *)rdfPath
         uriString:(NSString *)uriString;

- (RedlandParser *)parser;
- (RedlandModel *)model;

- (RedlandQueryResults *)queryModelWithSPARQLQuery:(NSString *)query;
- (RedlandQueryResults *)queryModelWithQuery:(NSString *)query
                               queryLanguage:(NSString *)queryLanguage;
- (NSString *)queryModelReturnStringWithSPARQLQuery:(NSString *)query
                                    withNamedFormat:(NSString *)formatName
                                            baseURI:(RedlandURI *)baseURI;

@end
