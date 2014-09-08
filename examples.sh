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
INFO "Info log with default configurations"
DEBUG "Debug log with default configurations"

# Overwriting default configurables
echo # newline
export LOGFILE=~/my-bash-logger.log
export LOG_DATE_FORMAT='+%c'
export LOG_FORMAT='%LEVEL %DATE -- %MESSAGE'
NOTICE "Configurations changed"

DEBUG "example debug log"
NOTICE "example notice log"
WARNING "example warning log"

# re-source to overwrite config changes
echo
source bash-logger.sh
NOTICE "Configurations Reset"
DEBUG "example debug log"
NOTICE "example notice log"
WARNING "example warning log"


# Overwriting log function behavior (eg. don't exit on errors)
echo # newline
INFO "Changing default log behavior"
ERROR()     { LOG_HANDLER_DEFAULT "$FUNCNAME" "$@"; }
CRITICAL()  { LOG_HANDLER_DEFAULT "$FUNCNAME" "$@"; }
ALERT()     { LOG_HANDLER_DEFAULT "$FUNCNAME" "$@"; }
EMERGENCY() { LOG_HANDLER_DEFAULT "$FUNCNAME" "$@"; }
NOTICE "default logging behavior overwritten"

# Example of all log levels
echo # newline
DEBUG "Example Debug log"
INFO "Example Info log"
NOTICE "Example Notice log"
WARNING "Example Warning log"
ERROR "Example Error log"
CRITICAL "Example Critical log"
ALERT "Example Alert log"
EMERGENCY "Example Emergency log"

# Overwriting default log behavior (eg. adding another echo)
echo # newline
INFO "Adding additional default behavior"
LOG_HANDLER_DEFAULT() {
    local formatted_log="$(FORMAT_LOG "$@")"
    LOG_HANDLER_COLORTERM "$1" "$formatted_log"
    LOG_HANDLER_LOGFILE "$1" "$formatted_log"
    echo "logged to logfile"
}
NOTICE "test notice log"
