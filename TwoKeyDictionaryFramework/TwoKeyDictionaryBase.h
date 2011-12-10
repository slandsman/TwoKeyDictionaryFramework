/**
  TwoKeyDictionaryBase.h

  Abstract base class for Two Key dictionaries

  @copyright Copyright (c) 2011 HomeForDerangedScientists. All rights reserved.
  @author Seth Landsman <mailto:seth@homeforderangedscientists.net>

*/

#import <Foundation/Foundation.h>

@interface TwoKeyDictionaryBase : NSObject
{
    /** instance variable containing the backing store */
    NSMutableDictionary *int_dict;
}

/** 
 copy constructor for the dictionary
 
 @param d Another two key dictionary
*/
-(id)initWithDictionary:(TwoKeyDictionaryBase *)d;

/**
 retrieve the backing data source
 
 @returns an NSMutableDictionary representing the internal data structure
*/
-(NSMutableDictionary *)backingData;

/** 
 Retreive the object from the dictionary. Follows the same behavior as
    NSMutableDictionary for failed retrievals
 
 @see NSDictionary
 @param key1 the first key value
 @param key2 the second key value
 @returns the object (as an id) returned from the internal store. Follows the same behavior as NSDictionary
*/
-(id)objectForKeyOne:(id)key1 andKeyTwo:(id)key2;

/** 
 Retreive the object from the dictionary with integer based keys. Follows the same behavior as
 NSMutableDictionary for failed retrievals
 
 Underlying implementation boxes the integer values to NSNumbers
 
 @see NSDictionary, NSNumber
 @param key1 the first key value
 @param key2 the second key value
 @returns the object (as an id) returned from the internal store. Follows the same behavior as NSDictionary
 */
-(id)objectForIndexOne:(int)key1 andIndexTwo:(int)key2;

/**
 Get a flat array of all values in the dictionary
 
 @returns the dictionary flattened as an array of id values
*/
-(NSArray *)allValues;

/**
 Get a count of number of values in the dictionary. Short cut for
    [[dict allValues] count];
 
 @see NSDictionary#count
 
 @returns the equivlient of [[dict allValues] count];
*/
-(NSUInteger)count;

@end
