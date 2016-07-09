//
//  SVTDictionaryBook.m
//  Exercise 4
//
//  Created by Тимофей Савицкий on 7/9/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTDictionaryBook.h"

NSString *const kSVTReaderKeyTitle = @"title";
NSString *const kSVTReaderKeyYear = @"year";
NSString *const kSVTReaderKeyType = @"type";
NSString *const kSVTReaderKeyOwner = @"owner";
NSString *const kSVTReaderKeyIdentifier = @"identifier";

@implementation SVTBook(SVTDictionaryBook)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    self = [self initWithBookID:aDictionary[kSVTReaderKeyTitle]
                       yearBook:[aDictionary[kSVTReaderKeyYear] intValue]
                       bookType:[aDictionary[kSVTReaderKeyType] intValue]
                     identifier:aDictionary[kSVTReaderKeyIdentifier]];
    if (self.owner)
        self = aDictionary[kSVTReaderKeyOwner];
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (self.nameBook)
        result [kSVTReaderKeyTitle] = self.nameBook;
    if (self.yearBook)
        result [kSVTReaderKeyYear] = [NSNumber numberWithInt: self.yearBook];
    if (self.bookType == 0 || self.bookType == 1)
        result [kSVTReaderKeyType] = [NSNumber numberWithInt: self.bookType];
    if (self.owner)
        result [kSVTReaderKeyOwner] = self.owner;
    if (self.identifier)
        result [kSVTReaderKeyIdentifier] = self.identifier;
    return result;
}

@end
