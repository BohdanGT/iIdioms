//
//  IdiomsProvider.m
//  iIdioms
//
//  Created by Bohdan Kachur on 12/3/11.
//  Copyright (c) 2011 bbsoft. All rights reserved.
//

#import "IdiomsProvider.h"
#import "Idiom.h"

@interface IdiomsProvider() 
-(Idiom *) parseIdiom:(NSString *)idiomData;
-(NSString *) getString:(NSString*) theString BetweenRange:(NSRange) range1 andRange2:(NSRange) range2;
@end

@implementation IdiomsProvider

@synthesize delegate = _delegate;

-(void) initNewIdiomRequest
{
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:IdiomsURL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (theConnection) {
        idiomRawData =  [[NSMutableData data] retain];
    }
    else
    {
        NSLog(@"Feild to create NSURLConnection object");
    }
 
} // end initNewIdiomRequest

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [idiomRawData setLength:0];
} // end connection:didreceiveResponse

-(void) connection: (NSURLConnection *) connection didReceiveData:(NSData *)data
{
    [idiomRawData appendData:data];
} // end connection:didreceiveData


-(void) connection: (NSURLConnection *) connection didFailWithError:(NSError *)error
{
    [connection release];
    [idiomRawData release];
    idiomRawData = nil;
   
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
    if (_delegate != nil)
        [_delegate idiomArrivedWithError:[error localizedDescription]];
    
} // end connection:didReceiveResponse:

-(void) connectionDidFinishLoading: (NSURLConnection *) connection  
{
    NSLog(@"connectionDidFinishLoading call");
    NSLog(@"data length : %lu", idiomRawData.length);
    if (idiomRawData.length > 0) {
        
        NSLog(@"byte: %s\n", [idiomRawData mutableBytes]);
        
        NSString *string = [[NSString alloc] initWithBytes:[idiomRawData mutableBytes] length:idiomRawData.length encoding:NSUTF8StringEncoding];
        NSLog(@"We got string : %@", string);
        
        Idiom *idiom = [self parseIdiom:string];
        if (idiom != nil && _delegate != nil)
            [_delegate newIdiomArrived:idiom];
        else if (_delegate != nil)
                [_delegate idiomArrivedWithError:@"Wrong data"];
            
       [string release];       
    }
    else
    {
        if (_delegate != nil)
            [_delegate idiomArrivedWithError:@"No data"];
     }
    
    [idiomRawData release];
    idiomRawData = nil;
    [connection release];
    
} // connectionDidFinishLoading


-(Idiom *) parseIdiom:(NSString *)idiomData
{
    Idiom* idiom = nil;
    NSString *idiomName = nil;
    NSString *idiomDescription = nil;
    NSString *idiomExample = nil;
    
    NSString *idiomStr = [idiomData retain];
    
    NSRange beginIdiomRange = [idiomStr rangeOfString:@"<p id=\"idiom\">"];
    NSRange endIdiomRange = [idiomStr rangeOfString:@"</p>"];
    
    if (beginIdiomRange.location != NSNotFound && endIdiomRange.location != NSNotFound) {
        idiomName = [self getString:idiomStr BetweenRange:beginIdiomRange andRange2:endIdiomRange];
        NSLog(@"Idiom name: %@", idiomName);
        
        NSRange beginDescriptionRange = [idiomStr rangeOfString:@"<p id=\"translate\">"];
        if (beginDescriptionRange.location != NSNotFound) {
            NSRange nsRange = NSMakeRange(NSMaxRange(beginDescriptionRange), idiomData.length - NSMaxRange(beginDescriptionRange));
            NSRange endDescriptionRange = [idiomStr rangeOfString:@"</p>" options:nil range:nsRange];
            if (endDescriptionRange.location != NSNotFound) {
               idiomDescription = [self getString:idiomStr BetweenRange:beginDescriptionRange andRange2:endDescriptionRange];
               NSLog(@"Idiom description: %@", idiomDescription);
            }
            
            NSRange beginExampleRange = [idiomStr rangeOfString:@"<p id=\"example\">"];
            if (beginExampleRange.location != NSNotFound) {
                nsRange = NSMakeRange(NSMaxRange(beginExampleRange), idiomStr.length - NSMaxRange(beginExampleRange));   
                NSRange endExampleRange = [idiomStr rangeOfString:@"</p>" options:nil range:nsRange];
                
                if (endExampleRange.location != NSNotFound) {
                   idiomExample = [self getString:idiomStr BetweenRange:beginExampleRange andRange2:endExampleRange];
                    NSLog(@"Idiom example: %@", idiomExample);
                }
            }
        }
        
    }
    
    [idiomStr release];
    
    if (idiomName != nil && idiomDescription != nil && idiomExample != nil)
       idiom = [[[Idiom alloc] initWithName:idiomName IdiomDescription:idiomDescription IdiomExample:idiomExample] autorelease];
        
    return idiom;
} // end parseIdiom

-(NSString *) getString:(NSString*) theString BetweenRange:(NSRange) range1 andRange2:(NSRange) range2;
{
    NSString *idiomName = nil;
    if (range1.location != NSNotFound && range2.location != NSNotFound) {
        
        idiomName = [theString substringWithRange:NSMakeRange(NSMaxRange(range1), range2.location -  NSMaxRange(range1))];
        [idiomName autorelease];
    }
    
    return idiomName;
} // end getString: BetweenRange: andRange2

@end
