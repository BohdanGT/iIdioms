//
//  Idiom.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "Idiom.h"

@interface Idiom()
-(id) init;
@end

@implementation Idiom
@synthesize IdiomName = _idiomName;
@synthesize IdiomDescription = _idiomDescription;
@synthesize IdiomExample = _idiomExample;


-(id) initWithName:(NSString *)theIdiomName IdiomDescription:(NSString *) theIdiomDescription IdiomExample:(NSString *) theIdiomExample
{
    if (self = [super init]) {
        
        _idiomName = theIdiomName;
        _idiomDescription = theIdiomDescription;
        _idiomExample = theIdiomExample;
        
    }
    
    return self;
} // end initWithName:IdiomDescription:IdiomExample

-(id) init
{
    return  [super init];
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"Idiom name: %@; Idiom descrition: %@; Idiom example: %@", _idiomName, _idiomDescription, _idiomExample];
}

@end
