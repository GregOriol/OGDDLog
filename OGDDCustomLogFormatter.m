//
//  OGDDCustomLogFormatter.m
//
//  Created by Grégory ORIOL on 01/05/12.
//  Copyright (c) 2012 Grégory ORIOL. All rights reserved.
//

#import "OGDDCustomLogFormatter.h"

@implementation OGDDCustomLogFormatter

@synthesize detailed;

- (id)init
{
    if ((self = [super init])) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];

        detailed = NO;
    }

    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_ERROR : logLevel = @"ERROR"; break;
        case LOG_FLAG_WARN  : logLevel = @"WARN"; break;
        case LOG_FLAG_INFO  : logLevel = @"INFO"; break;
        default             : logLevel = @"DEBUG"; break;
    }
    
    NSString *dateAndTime = [dateFormatter stringFromDate:(logMessage->timestamp)];
    NSString *logMsg = logMessage->logMsg;
    NSString *fullFile = [NSString stringWithCString:logMessage->file encoding:NSASCIIStringEncoding];
    NSString *shortFile = [[fullFile lastPathComponent] stringByReplacingOccurrencesOfString:@".m" withString:@""];
    NSString *function = [NSString stringWithCString:logMessage->function encoding:NSASCIIStringEncoding];

    if (detailed) {
        return [NSString stringWithFormat:@"%@ [%@] [%@->%@#%i] %@\n", dateAndTime, logLevel, shortFile, function, logMessage->lineNumber, logMsg];
    }
    else {
        return [NSString stringWithFormat:@"%@ [%@] %@\n", dateAndTime, logLevel, logMsg];
    }
}

@end
