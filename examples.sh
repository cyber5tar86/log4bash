#!/bin/bash
#--------------------------------------------------------------------------------------------------
# Bash Logger
# Copyright (c) Dean Rather
# Licensed under the MIT license
# http://github.com/deanrather/bash-logger
#--------------------------------------------------------------------------------------------------

# Including the logger functions
source bash-logger.sh

# Regular Usage
DEBUG "test debug log"
INFO "test info log"

# Overwriting default configurables
export LOGFILE=~/my-bash-logger.log
export LOG_DATE_FORMAT='+%c'
export LOG_FORMAT='%LEVEL %DATE -- %MESSAGE'

DEBUG "test debug log"
INFO "test info log"
NOTICE "test notice log"
WARNING "test warning log"

# Overwriting log function behavior (eg. don't exit on errors)
ERROR() { LOG_HANDLER_DEFAULT "$FUNCNAME" "$@"; }

ERROR "test error log"

# Overwriting default log behavior (eg. adding another echo)
LOG_HANDLER_DEFAULT() {
    local formatted_log="$(FORMAT_LOG "$@")"
    LOG_HANDLER_COLORTERM "$1" "$formatted_log"
    LOG_HANDLER_LOGFILE "$1" "$formatted_log"
    echo "logged to logfile"
}
NOTICE "test notice log"

ALERT "test alert log"
EMERGENCY "test emergency log"
