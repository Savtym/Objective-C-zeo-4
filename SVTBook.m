//
//  SVTBook.m
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTBook.h"

@implementation SVTBook

- (instancetype)initWithBookValue:(NSString *)bookName yearBook:(int)bookYear bookType:(bookType)bookCoverType {
    return [self initWithBookID:bookName yearBook:bookYear bookType:bookCoverType identifier:[[NSUUID alloc] init].UUIDString];
}

+ (instancetype)bookWithName:(NSString *)name yearBook:(int)year bookType:(bookType)newType {
    return [[[self alloc] initWithBookValue:name yearBook:year bookType:newType] autorelease];
}

- (NSString *)nameBook {
    return _nameBook;
}

- (void)setNameBook:(NSString *)newNameBook {
    if (newNameBook != _nameBook) {
        [_nameBook release];
        _nameBook = [newNameBook copy];
    }
}

- (int)yearBook {
    return _yearBook;
}

- (void)setYearBook:(int)newYearBook {
    _yearBook = newYearBook;
}

- (bookType)bookType {
    return _bookType;
}

- (void)SetBookType:(bookType)newSetBookType {
    _bookType = newSetBookType;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"\n\nName: %@;\nYear: %d;\nType of Book: %@;\nIdentifier: %@;\n\n", [self nameBook], [self yearBook], [self bookType] == SVTBookPaperBack ? @"Paperback" : @"Hardcover", [self identifier] ];
}


//------------------------(4)

- (instancetype)init {
    return [self initWithBookID:nil yearBook:0 bookType:0 identifier:[[NSUUID alloc] init].UUIDString];
}

- (instancetype)initWithBookID:(NSString *)bookName yearBook:(int)bookYear bookType:(bookType)bookCoverType identifier:(NSString*)aIdentifier {
    self = [super init];
    if (self != nil) {
        _nameBook = bookName;
        _yearBook = bookYear;
        _bookType = bookCoverType;
        _identifier = aIdentifier;
    }
    return self;
}

- (NSString *)identifier {
    return _identifier;
}

- (NSUInteger)hash {
    return [self.nameBook hash] ^ self.yearBook ^ self.bookType ^ [self.identifier hash] ^ [self.owner hash];
}

- (BOOL)isEqual:(SVTBook*)aBook {
    BOOL result = NO;
    if ([aBook isKindOfClass:[SVTBook class]] &&
        self.hash == aBook.hash &&
        [self.nameBook isEqual:aBook.nameBook] &&
        self.yearBook == aBook.yearBook &&
        self.bookType == aBook.bookType &&
        self.owner == aBook.owner &&
        self.identifier == aBook.identifier) {
        result = YES;
    }
    return result;
}

@end
