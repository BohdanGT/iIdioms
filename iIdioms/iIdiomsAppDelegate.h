//
//  iIdiomsAppDelegate.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NewIdiomArriveDelegate.h"
@class IdiomsProvider;

@interface iIdiomsAppDelegate : NSObject <NSApplicationDelegate>
{
    IdiomsProvider *idiomsProvider;
}

@property (assign) IBOutlet NSWindow *window;


@end
