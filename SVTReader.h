//
//  SVTReader.h
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVTBook.h"

@interface SVTReader : NSObject

@property (readwrite, copy) NSString *firstName;
@property (readwrite, copy) NSString *lastName;
@property (readwrite) NSUInteger year;
@property (readonly) NSString *fullName;
@property (readonly) NSMutableArray<SVTBook *> *currentBook;

- (instancetype)initWithTitle:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear;
+ (instancetype)personWithName:(NSString *)newFirstName lastName:(NSString *)newLastName year:(NSUInteger)newYear;

- (BOOL)takeBook:(SVTBook *)aSVTBook;
- (BOOL)returnBook:(SVTBook *)aBook;

@end
