//
//  IdiomsStatusBarItem.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/7/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "IdiomsStatusBarItem.h"
#import "MAAttachedWindow.h"
#import "IdiomViewController.h"

@interface IdiomsStatusBarItem () 

-(id) init;

@end


@implementation IdiomsStatusBarItem

-(id) initWithRect:(NSRect)rect andMenu: (NSMenu*) statusItemMenu
{
    self = [super initWithFrame:rect];
    if(self) {
        
        statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
        [statusItem setHighlightMode:YES];
        [statusItem setView:self];
        
        appMenu  = [statusItemMenu retain];
        
        statusIconImage = [[NSImageView alloc] initWithFrame:rect];
        [statusIconImage setImage:[NSImage imageNamed:@"tray_icon.ico"]];
        
        idiomViewController = [[IdiomViewController alloc] initWithNibName:@"IdiomView" bundle:nil];
    }
    
    return self;
}

-(id) init
{
    return [self initWithRect:NSMakeRect(0, 0, 0, 0) andMenu:nil];
}

-(void) drawRect:(NSRect)dirtyRect
{
    [statusIconImage drawRect:dirtyRect];
}

-(void) mouseDown:(NSEvent *)theEvent
{
    NSRect frame = [[self window] frame];
    NSPoint pt = NSMakePoint(NSMidX(frame), NSMinY(frame));
    
    if (popupWindow == nil)
    {
        popupWindow = [[MAAttachedWindow alloc] initWithView:[idiomViewController view] attachedToPoint:pt inWindow:nil onSide:MAPositionBottom atDistance:5.0];
        [popupWindow makeKeyAndOrderFront:self];
    }
    else
    {
        [popupWindow orderOut:self];
        [popupWindow release];
        popupWindow = nil;
    }
    
    [self setNeedsDisplay:YES];
}

-(void) rightMouseDown:(NSEvent *)theEvent
{
    [statusItem popUpStatusItemMenu:appMenu];
    [self setNeedsDisplay:YES];
}

-(void) dealloc
{
    [statusItem release];
    [statusIconImage release];
    [super dealloc];
}

@end
