//
//  RDFSparqlQueryViewController.h
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDFData.h"

@interface RDFSparqlQueryViewController : UIViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) RDFData *data;

@end
