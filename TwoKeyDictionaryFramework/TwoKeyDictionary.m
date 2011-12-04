/**
 TwoKeyDictionary.h
 
 Immutable version of a two key dictionary
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */

#import "TwoKeyDictionary.h"

@implementation TwoKeyDictionary

#pragma mark - Initialization routines

-(id)initWithDictionary:(TwoKeyMutableDictionary *)d
{
    return [super initWithDictionary:d];
}

-(TwoKeyMutableDictionary *)mutableCopy
{
    return [[TwoKeyMutableDictionary alloc] initWithDictionary:self];
}

@end
