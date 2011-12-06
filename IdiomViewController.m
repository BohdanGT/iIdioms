//
//  IdiomViewController.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/6/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "IdiomViewController.h"
#import "IdiomsProvider.h"
#import "Idiom.h"

@implementation IdiomViewController
@synthesize IdiomName;
@synthesize IdiomDescription;
@synthesize IdiomExample;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        idiomsProvider = [[IdiomsProvider alloc] init];
        idiomsProvider.delegate = self;
        
    }
    
    return self;
}

- (IBAction)nextIdiomClick:(id)sender {
    
    [idiomsProvider initNewIdiomRequest];
}


-(void) idiomArrivedWithError:(NSString *)theError {
    NSLog(@"Idiom arrive error: %@", theError);
} // end idiomArrivedWithError

-(void) newIdiomArrived:(Idiom *)theIdiom {
    
    Idiom *idiom = [theIdiom retain];
    
    self.IdiomName.stringValue = idiom.IdiomName;
    self.IdiomDescription.stringValue = idiom.IdiomDescription;
    self.IdiomExample.stringValue = idiom.IdiomExample;
    [idiom release];
    
} // end newIdiomArrived


@end
