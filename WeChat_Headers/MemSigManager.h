//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>

#import "NSCoding-Protocol.h"

@class NSMutableDictionary;

@interface MemSigManager : NSObject <NSCoding>
{
    NSMutableDictionary *sigDict;
}

- (id)initWithCoder:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (void)printSig;
- (id)sigByName:(id)arg1;
- (void)addSig:(id)arg1;
- (void)dealloc;
- (id)init;

@end

