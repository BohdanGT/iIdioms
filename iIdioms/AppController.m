//
//  AppController.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/6/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "AppController.h"
#import "IdiomViewController.h"
#import "IdiomsStatusBarItem.h"

@implementation AppController
@synthesize IdiomView;
@synthesize AppMenu;

-(void) awakeFromNib
{
    NSRect rect = NSMakeRect(0, 0, 30, [[NSStatusBar systemStatusBar] thickness]);
    statusBarItem = [[IdiomsStatusBarItem alloc] initWithRect: rect andMenu:self.AppMenu];
}

@end
