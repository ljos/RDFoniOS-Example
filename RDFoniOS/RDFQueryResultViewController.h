//
//  RDFQueryResultViewController.h
//  RDFoniOS
//
//  Created by Bjarte Johansen on 11/30/12.
//  Copyright (c) 2012 Bjarte Johansen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDFQueryResultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, strong) NSString *queryText;


@end
