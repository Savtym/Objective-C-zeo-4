//
//  SVTLibrary.h
//  Exercise 4
//
//  Created by Тимофей Савицкий on 7/8/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVTBook.h"
#import "SVTReader.h"

@interface SVTLibrary : NSObject

@property (atomic, readonly, assign) NSArray<SVTBook*> *books;
@property (atomic, readonly, assign) NSArray<SVTReader*> *readers;

- (instancetype)initWithTitle:(NSArray*)newBooks readers:(NSArray*)newReaders;

- (void)addBooks:(SVTBook *)aBook;
- (void)removeBooks:(SVTBook *)aBook;

- (void)addReaders:(SVTReader *)aReader;
- (void)removeReaders:(SVTReader *)aReader;

@end
