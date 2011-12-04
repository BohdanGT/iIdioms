//
//  Idiom.h
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Idiom : NSObject
{

}

@property (copy, nonatomic, readonly) NSString *IdiomName;
@property (copy, nonatomic, readonly) NSString *IdiomDescription;
@property (copy, nonatomic, readonly) NSString *IdiomExample;

-(id) initWithName:(NSString *)theIdiomName IdiomDescription:(NSString *) theIdiomDescription IdiomExample:(NSString *) theIdiomExample;

@end
