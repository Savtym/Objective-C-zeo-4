//
//  SVTLibrary.m
//  Exercise 4
//
//  Created by Тимофей Савицкий on 7/8/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTLibrary.h"

@interface SVTLibrary()
@property (atomic, readonly, assign) NSMutableArray<SVTBook*> *mBooks;
@property (atomic, readonly, assign) NSMutableArray<SVTReader*> *mReaders;
@end

@implementation SVTLibrary {
    @private
    NSArray<SVTBook *> *_books;
    NSArray<SVTReader *> *_readers;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _mBooks = [[NSMutableArray alloc] init];
        _mReaders = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithTitle:(NSArray*)newBooks readers:(NSArray*)newReaders {
    self = [super init];
    if (self) {
        _books = newBooks;
        _readers = newReaders;
    }
    return self;
}

- (NSArray<SVTBook*>*)books {
    return (NSArray*) self.mBooks;
}

- (NSArray<SVTReader*>*)readers {
    return (NSArray*) self.mReaders;
}

- (BOOL)containsBooks:(SVTBook*)aBook {
    BOOL result = NO;
    for (SVTBook* iCur in self.books)
        if ([iCur isEqual:aBook]) {
            result = YES;
            break;
        }
    return result;
}

- (void)addBooks:(SVTBook *)aBook {
    if ([self containsBooks:aBook])
        @throw (@"This book already in library");
    [self.mBooks addObject:aBook];
}

- (void)removeBooks:(SVTBook *)aBook {
    [self.mBooks removeObject:aBook];
}

- (BOOL)containsReaders:(SVTReader*)aReader {
    BOOL result = NO;
    for (SVTReader *iCur in self.readers)
        if ([iCur isEqual:aReader]) {
            result = YES;
            break;
        }
    return result;
}

- (void)addReaders:(SVTReader *)aReader {
    if ([self containsReaders:aReader])
        @throw (@"This reader already in library");
    [self.mReaders addObject:aReader];
}

- (void)removeReaders:(SVTReader *)aReader {
    [self.mReaders removeObject:aReader];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\nLibrary:%@\n%@",self.books,self.readers];
}

@end
