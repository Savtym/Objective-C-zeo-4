//
//  main.m
//  Exercise 3
//
//  Created by Тимофей Савицкий on 7/6/16.
//  Copyright © 2016 Тимофей Савицкий. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVTBook.h"
#import "SVTReader.h"
#import "SVTLibrary.h"
#import "SVTDictionaryBook.h"
#import "SVTDictionaryReader.h"
#import "SVTDictionaryLibrary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SVTBook *book1 = [[[SVTBook alloc] init] autorelease];
        
        [book1 setNameBook:@"master and margarita"];
        [book1 setYearBook:1927];
        [book1 SetBookType:0];
        
        NSLog(@"%@",book1);
        
        
        SVTBook *book2 = [[[SVTBook alloc] initWithBookValue:@"Idiot" yearBook:1897 bookType:1] autorelease];
        
        NSLog(@"%@",book2);
        
        SVTBook *book3 = [SVTBook bookWithName: @"Romeo and Juliet" yearBook:1689 bookType: 0];
        
        NSLog(@"%@",book3);
        [book3 setYearBook:1785];
        [book3 SetBookType:1];
        NSLog(@"%@",book3);
        
//      ------------------------------------- (3)
        
        SVTReader *reader1 =[[[SVTReader alloc] init] autorelease];
        
        [reader1 setFirstName:@"First"];
        [reader1 setLastName:@"Person"];
        [reader1 setYear:2004];
        
        NSLog(@"%@",reader1);
        
        
        SVTReader *reader2 = [[[SVTReader alloc] initWithTitle:@"Second" lastName:@"Person(2)" year:1898] autorelease];
        
        NSLog(@"%@",reader2);
        
        SVTReader *reader3 = [SVTReader personWithName: @"Fifth"  lastName:@"Person(3)" year:2000];
        
        SVTLibrary *libr1 = [[[SVTLibrary alloc] init] autorelease];
        
        [libr1 addBooks:book1];
        [libr1 removeBooks:book1];
        [libr1 addBooks:book1];
        
        [libr1 addReaders:reader1];
        [libr1 removeReaders:reader1];
        [libr1 addReaders:reader1];

        
        NSLog(@"%@",libr1);
        
        
        NSLog(@"%@",reader3);
        [reader3 setYear:1985];
        [reader3 setFirstName:@"Third"];
        NSLog(@"%@",reader3);
        [reader3 takeBook:book3];
        [reader3 takeBook:book2];
        [reader3 returnBook:book2];
        NSLog(@"%@",[book3 dictionaryRepresentation]);
        NSLog(@"%@",[reader3 dictionaryRepresentation]);
        NSLog(@"%@",[libr1 dictionaryRepresentation]);
        
    }
    return 0;
}
