//
//  IdiomViewController.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/6/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NewIdiomArriveDelegate.h"
@class IdiomsProvider;

@interface IdiomViewController : NSViewController <NewIdiomArriveDelegate>
{
    IdiomsProvider *idiomsProvider;
}

@property (assign) IBOutlet NSTextField *IdiomName;
@property (assign) IBOutlet NSTextField *IdiomDescription;
@property (assign) IBOutlet NSTextField *IdiomExample;

@end
