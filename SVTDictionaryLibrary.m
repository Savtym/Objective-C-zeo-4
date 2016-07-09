//
//  SVTDictionaryLibrary.m
//  Exercise 4
//
//  Created by Тимофей Савицкий on 7/9/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTDictionaryLibrary.h"

NSString *const kSVTReaderKeyBooks = @"books";
NSString *const kSVTReaderKeyReaders = @"readers";

@implementation SVTLibrary(SVTDictionaryLibrary)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    return [self initWithTitle:aDictionary[kSVTReaderKeyBooks] readers:aDictionary[kSVTReaderKeyReaders]];
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (self.books)
        result [kSVTReaderKeyBooks] = self.books;
    if (self.readers)
        result [kSVTReaderKeyReaders] = self.readers;
    return result;
}

@end
