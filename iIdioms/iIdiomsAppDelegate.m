//
//  iIdiomsAppDelegate.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "iIdiomsAppDelegate.h"
#import "Idiom.h"
#import "IdiomsProvider.h"

@implementation iIdiomsAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    idiomsProvider = [[IdiomsProvider alloc] init];
    idiomsProvider.delegate = self;
}

- (IBAction)getIdiomClick:(id)sender {
    
    [idiomsProvider initNewIdiomRequest];
    
}


-(void) idiomArrivedWithError:(NSString *)theError
{
    NSLog(@"Idiom arrive error: %@", theError);
}

-(void) newIdiomArrived:(Idiom *)theIdiom
{
    NSLog(@"New idiom arrived");
    NSLog(@"%@", theIdiom.description);
}

@end
