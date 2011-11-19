//
//  TwoKeyDictionary.h
//
//  Immutable version of a two key dictionary
//
//  Created by Seth Landsman <mailto:seth@homeforderangedscientists.net> on 10/2/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoKeyDictionaryBase.h"
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyDictionary : TwoKeyDictionaryBase

// copy constructor for the dictionary
-(id)initWithDictionary:(TwoKeyMutableDictionary *)d;

@end
