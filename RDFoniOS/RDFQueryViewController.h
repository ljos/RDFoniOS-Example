//
//  RDFQueryViewController.h
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDFData.h"

@interface RDFQueryViewController : UITableViewController
{
    RDFData *data;
    NSArray *formatNames;
    RedlandQueryResults *queryResults;
}

@end
