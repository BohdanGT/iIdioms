//
//  IdiomsStatusBarItem.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/7/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MAAttachedWindow;
@class IdiomViewController;

@interface IdiomsStatusBarItem : NSView
{
    NSStatusItem *statusItem;
    NSImageView *statusIconImage;
    NSMenu *appMenu;
    MAAttachedWindow *popupWindow;
    IdiomViewController *idiomViewController;
}

-(id) initWithRect:(NSRect)rect andMenu: (NSMenu*) statusItemMenu;

@end
