//
//  TwoKeyDictionary.m
//
//  Immutable version of a two key dictionary
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

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
