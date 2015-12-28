//
//  APStudent.m
//  Lesson 15 HW 2
//
//  Created by Alex on 28.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APStudent.h"

@implementation APStudent

- (NSString*) answerByType: (APStudentSubjectType) subj {
    return self.subjectType & subj ? @"YES" : @"NO";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ studies: "
            "biology = %@"
            ",math = %@"
            ",development = %@"
            ",english = %@"
            ",russian = %@",
            self.name,
            [self answerByType:APStudentSubjectTypeBiology],
            [self answerByType:APStudentSubjectTypeMath],
            self.subjectType & APStudentSubjectTypeDevelopment ? @"YES" : @"NO",
            self.subjectType & APStudentSubjectTypeEnglish ? @"YES" : @"NO",
            self.subjectType & APStudentSubjectTypeRussian ? @"YES" : @"NO"];
  
}

@end
