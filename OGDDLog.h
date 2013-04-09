//
//  OGDDLog.h
//
//  Created by Grégory ORIOL on 01/05/12.
//  Copyright (c) 2012 Grégory ORIOL. All rights reserved.
//

//
// DDLog implementation helpers
//

#import "DDLog.h"

#ifndef LOG_LEVEL_DEBUG
#define LOG_LEVEL_DEBUG LOG_LEVEL_VERBOSE
#endif

#ifndef DDLogDebug
#define DDLogDebug DDLogVerbose
#endif

#ifndef DDLOG_SETLEVEL
#ifdef DEBUG
#define DDLOG_SETLEVEL(debug_level,release_level)           \
static int ddLogLevel = debug_level;
#else
#define DDLOG_SETLEVEL(debug_level,release_level)           \
static int ddLogLevel = release_level;
#endif
#endif

#ifndef DDLOG_SETDEFAULTLEVEL
#define DDLOG_SETDEFAULTLEVEL                               \
DDLOG_SETLEVEL(LOG_LEVEL_DEBUG,LOG_LEVEL_WARN)
#endif

#ifndef DDLOG_IMPLEMENTATION
#define DDLOG_IMPLEMENTATION                                \
+ (int)ddLogLevel                                           \
{                                                           \
    return ddLogLevel;                                      \
}                                                           \
                                                            \
+ (void)ddSetLogLevel:(int)logLevel                         \
{                                                           \
    ddLogLevel = logLevel;                                  \
}
#endif
