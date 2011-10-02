//
//  TwoKeyMutableDictionary.h
//  GameOfLife
//
//  Created by Seth Landsman on 9/10/11.
//  Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoKeyMutableDictionary : NSObject

@property(strong) NSMutableDictionary *int_dict;

-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2;
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;
-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2;
-(NSArray *)allValues;
-(void)removeAllObjects;

@end
