#!/bin/bash

# args:
# $1 the error code of the last command (should be explicitly passed)
# $2 the message to print in case of an error
# 
# an error message is printed and the script exists with the provided error code
function error_exit {
	echo "$2 : error code: $1"
	exit ${1}
}

export PATH=$PATH:/usr/sbin:/sbin || error_exit $? "Failed on: export PATH=$PATH:/usr/sbin:/sbin"

ctx logger info "Stopping apache..."
sudo /etc/init.d/apache2 stop || error_exit $? "Failed on: sudo /etc/init.d/apache2 stop"

ctx logger info "End of $0"
echo "End of $0"