//
//  ViewController.m
//  NSDictionary
//
//  Created by Наташа on 14.04.18.
//  Copyright © 2018 Наташа. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Create NSDictionary using literal declaration
    NSString *first = @"firstName";
    NSString *last = @"lastName";
    NSDictionary *dict1 = [[NSDictionary dictionaryWithObjectsAndKeys: @"Robert",first ,@"Dawny",last, nil] retain];
    
    //Make it mutable and add several new entries
    NSMutableDictionary *mutDict = [[NSMutableDictionary dictionaryWithDictionary:(dict1)] retain];
    [dict1 release];
    NSString *middle = @"middleName";
    NSString *jun = @"junName";
    [mutDict setObject:@"John" forKey: middle];
    [mutDict setObject:@"Junior" forKey: jun];
    [mutDict release];
    
    //Sort in an ascending and descending order
    NSMutableDictionary *dict2 = [[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt:(12)],@"Smith",
                                   [NSNumber numberWithInt:(8)],@"Green",
                                   [NSNumber numberWithInt:(22)],@"Trump",
                                   [NSNumber numberWithInt:(14)],@"Obama", nil] retain];
    NSArray *sortAscending = [[dict2 keysSortedByValueUsingSelector:@selector (compare:)] retain];
    for (NSString *element in sortAscending) {
        NSLog(@"element: %@", element);
    }
    [sortAscending release];
    NSArray *sortDescending = [[dict2 keysSortedByValueUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }] retain];
    for (NSString *element in sortDescending) {
        NSLog(@"element: %@", element);
    }
    [sortDescending release];
    
    //Check whether required value is contained in the dictionary.
    if([dict2 objectForKey:@"Smith"]) {
        NSLog(@"Hooray, this value exists in dictionary");
    } else{
        NSLog(@"Sorry, there is no such value");
    }
    [dict2 release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
