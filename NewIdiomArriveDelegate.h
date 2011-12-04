//
//  NewIdiomArriveDelegate.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/4/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Idiom;

@protocol NewIdiomArriveDelegate <NSObject>

-(void) newIdiomArrived:(Idiom *)theIdiom;
-(void) idiomArrivedWithError:(NSString *) theError;

@end
