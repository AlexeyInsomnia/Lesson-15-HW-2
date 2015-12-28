//
//  AppDelegate.m
//  Lesson 15 HW 2
//
//  Created by Alex on 28.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "APStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<10; i++) {
        APStudent* student = [[APStudent alloc ] init];
        student.name = [NSString stringWithFormat:@"student name - %d", i+1];
       
        
        for (int z=0; z<5; z++) {
            if (arc4random()%2) {
                student.subjectType = student.subjectType | [self returnSubjectType:z];
            }
            
        }
        
        [array addObject:student];
        
    }
    
    NSLog(@"%@", array);
    
    
    NSMutableArray* arrayOthers = [[NSMutableArray alloc] init];
    
    NSMutableArray* arrayTranslators = [[NSMutableArray alloc] init];
    
    NSInteger countDevelopers = 0;
    // task is - group in array Translators students that learn BOTH engl and russian languages
    for (APStudent* student in array) {
        if (student.subjectType & APStudentSubjectTypeDevelopment) {
            countDevelopers = countDevelopers+1;
        }
        
        if (student.subjectType & APStudentSubjectTypeBiology) {
            NSLog(@"biology detected - cancel !!!!!");
            student.subjectType = student.subjectType &~ APStudentSubjectTypeBiology;
        }
        
        if ( (student.subjectType & APStudentSubjectTypeEnglish) && (student.subjectType & APStudentSubjectTypeRussian)) {
            [arrayTranslators addObject:student];
        } else {
            [arrayOthers addObject:student];
        }
    }
    
    NSLog(@"there are - %ld developers", countDevelopers);
    
    NSLog(@"TRANSLATORS %@", arrayTranslators);
    
    NSLog(@"OTHERS %@", arrayOthers);

    NSLog(@"superman");
    
    NSMutableString* numberInBits = [[NSMutableString alloc] init];
    NSInteger randomInteger = arc4random () % (NSNotFound);
    
    NSLog(@"random is - %ld ", randomInteger);
    
    for (int i = 31; i>=0; i--) {
        NSInteger maskBit = 1<<i;
        if ((randomInteger&maskBit)==0) {
            [numberInBits appendString:@"0"];
        } else {
            [numberInBits appendString:@"1"];

        }
    }
    
    NSLog(@"%@",numberInBits);
        
    return YES;
}

- (APStudentSubjectType) returnSubjectType:(NSInteger) numberSubjectType {
    APStudentSubjectType tempSubj ;
    switch (numberSubjectType) {
        case 0:
            tempSubj = APStudentSubjectTypeBiology;
            break;
        case 1:
            tempSubj = APStudentSubjectTypeMath;
            break;
        case 2:
            tempSubj = APStudentSubjectTypeDevelopment;
            break;
        case 3:
            tempSubj = APStudentSubjectTypeEnglish;
            break;
        case 4:
            tempSubj = APStudentSubjectTypeRussian;
            break;
    }
    return tempSubj; //hmm donno why yellow problem
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
