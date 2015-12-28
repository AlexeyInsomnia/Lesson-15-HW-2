//
//  APStudent.h
//  Lesson 15 HW 2
//
//  Created by Alex on 28.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    
    APStudentSubjectTypeBiology     =1<<0,
    APStudentSubjectTypeMath        =1<<1,
    APStudentSubjectTypeDevelopment =1<<2,
    APStudentSubjectTypeEnglish     =1<<3,
    APStudentSubjectTypeRussian     =1<<4,
    
} APStudentSubjectType;

@interface APStudent : NSObject

@property (assign, nonatomic) APStudentSubjectType subjectType;
@property (strong, nonatomic) NSString* name;

@end
