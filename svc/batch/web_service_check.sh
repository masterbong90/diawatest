#!/bin/bash
log_file=/svc/batch/log/$(date +%Y%m%d).log


echo "[ $(date '+%Y-%m-%d %T') ]  ====================== competition-1.0-SNAPSHOT.jar 체크 시작 ======================"  >> $log_file
pid_report_batch=`ps -ef | grep "competition-1.0-SNAPSHOT.jar" | grep -v 'grep' | awk '{print $2}'`
if [ -z $pid_report_batch ]; then
   java -jar -Dspring.profiles.active=production /svc/com.daiwa.competition/competition-1.0-SNAPSHOT.jar & >> $log_file 
   echo "[ $(date '+%Y-%m-%d %T') ] competition-1.0-SNAPSHOT.jar 시작 "  >> $log_file
else 
  echo "[ $(date '+%Y-%m-%d %T') ]  competition-1.0-SNAPSHOT.jar 정상 작상중 "   >> $log_file  
fi  
echo "[ $(date '+%Y-%m-%d %T') ]  ====================== competition-1.0-SNAPSHOT.jar 체크 끝 ======================"  >> $log_file
