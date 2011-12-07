//
//  AppController.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/6/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IdiomsStatusBarItem;

@interface AppController : NSObject
{
    IdiomsStatusBarItem *statusBarItem;
}

@property (assign) IBOutlet NSView *IdiomView;

@property (assign) IBOutlet NSMenu *AppMenu;

@end
