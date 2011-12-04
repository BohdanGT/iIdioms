//
//  IdiomsProvider.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewIdiomArriveDelegate.h"

static NSString* const IdiomsURL = @"http://dinternal.com.ua/rei/";

@interface IdiomsProvider : NSObject
{
    NSMutableData *idiomRawData;
}

-(void) initNewIdiomRequest;

@property (nonatomic, assign) id<NewIdiomArriveDelegate> delegate;

@end
