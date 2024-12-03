#!/bin/bash
. ~/.bash_profile
set -x
VAR=""
DPATH="${APP_HOME}/api_service/api_service1/"
log_level="INFO"
module_name="api_service1"
log_path="${LOG_HOME}/api_service/${module_name}"
build="api_service1.jar"
cd $DPATH
status=`ps -ef | grep $PNAME | grep java`
if [ "$status" != "$VAR" ]
then
 echo "The process is already running"
 echo $status
else
 echo "Starting process"
java -Dlog4j.configurationFile=file:./log4j2.xml -Dlog.level=${log_level} -Dlog.path=${log_path} -Dmodule.name=${module_name} -Dspring.config.location=file:./application.properties,file:${commonConfigurationFile} -jar ${build} 1>/dev/null 2>${log_path}/${module_name}.error &
#java -Dlog4j.configurationFile=file:log4j2.xml -Dmodule.name=APIService1 -Dspring.config.location=file:./application.properties,file:${APP_HOME}/configuration/configuration.properties -jar $build 1>/dev/null & 
echo "Process started"
fi
