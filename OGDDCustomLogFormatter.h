//
//  OGDDCustomLogFormatter.h
//
//  Created by Grégory ORIOL on 01/05/12.
//  Copyright (c) 2012 Grégory ORIOL. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DDLog.h"

@interface OGDDCustomLogFormatter : NSObject <DDLogFormatter>
{   
    NSDateFormatter *dateFormatter;

    BOOL detailed;
}

@property (nonatomic) BOOL detailed;

@end
