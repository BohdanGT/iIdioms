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

@interface  IdiomViewController()

-(void) showProgressIndicator;
-(void) hideProgressIndicator;

@end

@implementation IdiomViewController
@synthesize IdiomName;
@synthesize IdiomDescription;
@synthesize IdiomExample;
@synthesize ProgressIndicator;

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
    
    [self showProgressIndicator];
    [idiomsProvider initNewIdiomRequest];
}

-(void) showProgressIndicator {
    [self.IdiomName setHidden:YES];
    [self.IdiomExample setHidden:YES];
    [self.IdiomDescription setHidden:YES];
    [self.ProgressIndicator setHidden:NO];
    [self.ProgressIndicator startAnimation:self];
} // end showProgressIndicator

-(void) hideProgressIndicator {
    [self.IdiomName setHidden:NO];
    [self.IdiomExample setHidden:NO];
    [self.IdiomDescription setHidden:NO];
    [self.ProgressIndicator stopAnimation:self];
    [self.ProgressIndicator setHidden:YES];
    //[self.ProgressIndicator stopAnimation:self];
} // end showProgressIndicator

-(void) idiomArrivedWithError:(NSString *)theError {

    [self hideProgressIndicator];
    NSLog(@"Idiom arrive error: %@", theError);
} // end idiomArrivedWithError

-(void) newIdiomArrived:(Idiom *)theIdiom {
       
    Idiom *idiom = [theIdiom retain];
    
    self.IdiomName.stringValue = idiom.IdiomName;
    self.IdiomDescription.stringValue = idiom.IdiomDescription;
    self.IdiomExample.stringValue = idiom.IdiomExample;
    [idiom release];
    
   [self hideProgressIndicator];
    
} // end newIdiomArrived


@end
