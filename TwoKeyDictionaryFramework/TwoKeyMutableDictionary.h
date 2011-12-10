/**
 TwoKeyMutableDictionary.h
 
 Mutable varient of a two key indexed dictionary.
 
 @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
 @author Seth Landsman <mailto:seth@homeforderangedscientists.net>
 
 */

#import <Foundation/Foundation.h>
#import "TwoKeyDictionaryBase.h"

@interface TwoKeyMutableDictionary : TwoKeyDictionaryBase

/** 
 copy constructor for the dictionary
 
 @param data Another two key dictionary
 */
-(id)initWithDictionary:(TwoKeyDictionaryBase *)data;

/** Add an object to the dictionary. Overwrites the existing entry
  if an entry already exists 
 
 @param obj the object to store in the dictionary
 @param key1 the first key value
 @param key2 the second key value
 */
-(void)setObject:(id)obj forKeyOne:(id)key1 andKeyTwo:(id)key2;

/** Add an object to the dictionary that is keyed by two integers. 
 Overwrites the existing entry if an entry already exists 
 
 @param obj the object to store in the dictionary
 @param key1 the first key value
 @param key2 the second key value
 */
-(void)setObject:(id)obj forIndexOne:(int)key1 andIndexTwo:(int)key2;

/** Remove the object from the dictionary. Follows the same behavior as
 NSMutableDictionary for failed retrievals 
 
 @param key1 the first key value
 @param key2 the second key value

 */
-(void)removeObjectForKeyOne:(id)key1 andKeyTwo:(id)key2;

/** Remove the object keyed by two integers from the dictionary. 
 Follows the same behavior as NSMutableDictionary for failed retrievals 
 
 @param key1 the first key value
 @param key2 the second key value
 
 */
-(void)removeObjectForIndexOne:(int)key1 andIndexTwo:(int)key2;

/** Remove all objects from the dictionary */
-(void)removeAllObjects;

@end
