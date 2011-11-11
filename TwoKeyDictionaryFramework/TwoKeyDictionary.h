//
//  TwoKeyDictionary.h
//  TwoKeyDictionaryFramework
//
//  Created by Seth Landsman on 10/29/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoKeyMutableDictionary.h"

@interface TwoKeyDictionary : NSObject

-(id)initWithDictionary:(TwoKeyMutableDictionary *)d;
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;
-(NSArray *)allValues;
-(void)removeAllObjects;

@end
