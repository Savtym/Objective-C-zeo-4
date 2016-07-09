//
//  SVTDictionaryReader.m
//  Exercise 4
//
//  Created by Тимофей Савицкий on 7/9/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTDictionaryReader.h"

NSString *const kSVTReaderKeyFirstName = @"firstName";
NSString *const kSVTReaderKeyLastName = @"lastName";
NSString *const kSVTReaderKeyYearReader = @"year";
NSString *const kSVTReaderKeyCurrentBook = @"currentBook";

@implementation SVTReader(SVTDictionaryBook)

- (instancetype)initWithDictionaryRepresentation:(NSDictionary *)aDictionary {
    self = [self initWithTitle:aDictionary[kSVTReaderKeyFirstName]
                      lastName:aDictionary[kSVTReaderKeyLastName]
                          year:[aDictionary[kSVTReaderKeyYearReader] integerValue]];
    return self;
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    if (self.firstName)
        result [kSVTReaderKeyFirstName] = self.firstName;
    if (self.lastName)
        result [kSVTReaderKeyLastName] = self.lastName;
    if (self.year)
        result [kSVTReaderKeyYearReader] = [NSNumber numberWithInteger:self.year];
    if (self.currentBook)
        result [kSVTReaderKeyCurrentBook] = self.currentBook;
    return result;
}

@end
