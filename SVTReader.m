//
//  SVTReader.m
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import "SVTReader.h"

//@interface SVTReader()
//@property (readwrite,retain) NSMutableArray<SVTBook *> *currentBook;
//@end

@implementation SVTReader {
    @private
    NSString *_firstName;
    NSString *_lastName;
    NSUInteger _year;
}

- (instancetype)initWithTitle:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear {
    self = [self init];
    if (self != nil) {
        _firstName = [newFirstName copy];
        _lastName = [newLastName copy];
        _year = newYear;
        _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] copy];
    }
    return self;
}

+ (instancetype)personWithName:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear {
    return [[[self alloc] initWithTitle:newFirstName lastName:newLastName year:newYear] autorelease];
}

- (void)dealloc {
    [_firstName release];
    [_lastName release];
    [_fullName release];
    [_currentBook release];
    [super dealloc];
}

- (NSString *)firstName {
    return _firstName;
}

- (void)setFirstName:(NSString *)aFirstName {
    if (aFirstName != _firstName) {
        [_firstName release];
        _firstName = [aFirstName copy];
        if (_lastName != nil) {
            [_fullName release];
            _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] copy];
        }
    }
}

- (NSString *)lastName {
    return _lastName;
}

- (void)setLastName:(NSString *)aLastName {
    if (aLastName != _lastName) {
        [_lastName release];
        _lastName = [aLastName copy];
        if (_firstName != nil) {
            [_fullName release];
            _fullName = [[NSString stringWithFormat:@"%@ %@", _firstName, _lastName] copy];
        }
    }
}

- (NSUInteger)year {
    return _year;
}

- (void)setYear:(NSUInteger)aYear {
    _year = aYear;
}


- (NSString *)description {
    return [NSString stringWithFormat:@"\n%@ %@\n",[super description], [self fullName]];
}

- (BOOL)takeBook:(SVTBook *)aSVTBook {
    if (aSVTBook.owner == nil) {
        [self.currentBook addObject:aSVTBook];
        aSVTBook.owner = self;
        return YES;
    }
    return NO;
}

- (BOOL)returnBook:(SVTBook *)aBook {
    if ([self.currentBook containsObject:aBook]) {
        [self.currentBook removeObject:aBook];
        return YES;
    }
    return NO;
}

- (instancetype)init {
    self = [super init];
    if (self != nil)
        _currentBook = [[NSMutableArray alloc] init];
    return self;
}

- (NSUInteger)hash {
    return [self.firstName hash] ^ [self.lastName hash] ^ self.year ^ [self.currentBook hash] ^ [self.fullName hash];
}

- (BOOL)isEqual:(SVTReader*)aReader {
    BOOL result = NO;
    if ([aReader isKindOfClass:[SVTReader class]] &&
        self.hash == aReader.hash &&
        [self.firstName isEqual:aReader.firstName] &&
        [self.lastName isEqual:aReader.lastName] &&
        self.year == aReader.year &&
        self.currentBook == aReader.currentBook) {
        result = YES;
    }
    return result;
}

@end
