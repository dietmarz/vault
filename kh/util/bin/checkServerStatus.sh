#!/bin/bash

http_proxy="http://141.91.176.130:80"
no_proxy="localhost, 10.61.63.14, 10.61.63.22, 10.61.63.25, 10.61.63.24"

TIMEOUT_SEC=2

# Colors
RED='\033[0;31m'
GRE='\033[0;32m'
NC='\033[0m' # No Color

function mapCode() {
  code=$1;
  case $code in
       000) status="${RED}000 Not responding${NC} within $TIMEOUT_SEC seconds" ;;
       100) status="${RED}100 Informational:${NC} Continue" ;;
       101) status="${RED}101 Informational:${NC} Switching Protocols" ;;
       200) status="${GRE}OK${NC}" ;;
       201) status="${GRE}201 Successful:${NC} Created" ;;
       202) status="${GRE}202 Successful:${NC} Accepted" ;;
       203) status="${GRE}203 Successful:${NC} Non-Authoritative Information" ;;
       204) status="${GRE}204 Successful:${NC} No Content" ;;
       205) status="${GRE}205 Successful:${NC} Reset Content" ;;
       206) status="${GRE}206 Successful:${NC} Partial Content" ;;
       300) status="${RED}300 Redirection:${NC} Multiple Choices" ;;
       301) status="${RED}301 Redirection:${NC} Moved Permanently" ;;
       302) status="${RED}302 Redirection:${NC} Found residing temporarily under different URI" ;;
       303) status="${RED}303 Redirection:${NC} See Other" ;;
       304) status="${RED}304 Redirection:${NC} Not Modified" ;;
       305) status="${RED}305 Redirection:${NC} Use Proxy" ;;
       306) status="${RED}306 Redirection:${NC} status not defined" ;;
       307) status="${RED}307 Redirection:${NC} Temporary Redirect" ;;
       400) status="${RED}400 Client Error:${NC} Bad Request" ;;
       401) status="${RED}401 Client Error:${NC} Unauthorized" ;;
       402) status="${RED}401 Client Error:${NC} Payment Required" ;;
       403) status="${RED}403 Client Error:${NC} Forbidden" ;;
       404) status="${RED}404 Client Error:${NC} Not Found" ;;
       405) status="${RED}405 Client Error:${NC} Method Not Allowed" ;;
       406) status="${RED}406 Client Error:${NC} Not Acceptable" ;;
       407) status="${RED}407 Client Error:${NC} Proxy Authentication Required" ;;
       408) status="${RED}408 Client Error:${NC} Request Timeout within $TIMEOUT_SEC seconds" ;;
       409) status="${RED}409 Client Error:${NC} Conflict" ;;
       410) status="${RED}410 Client Error:${NC} Gone" ;;
       411) status="${RED}411 Client Error:${NC} Length Required" ;;
       412) status="${RED}412 Client Error:${NC} Precondition Failed" ;;
       413) status="${RED}413 Client Error:${NC} Request Entity Too Large" ;;
       414) status="${RED}414 Client Error:${NC} Request-URI Too Long" ;;
       415) status="${RED}415 Client Error:${NC} Unsupported Media Type" ;;
       416) status="${RED}416 Client Error:${NC} Requested Range Not Satisfiable" ;;
       417) status="${RED}417 Client Error:${NC} Expectation Failed" ;;
       500) status="${RED}500 Server Error:${NC} Internal Server Error" ;;
       501) status="${RED}501 Server Error:${NC} Not Implemented" ;;
       502) status="${RED}502 Server Error:${NC} Bad Gateway" ;;
       503) status="${RED}503 Server Error:${NC} Service Unavailable" ;;
       504) status="${RED}504 Server Error:${NC} Gateway Timeout within $TIMEOUT_SEC seconds" ;;
       505) status="${RED}505 Server Error:${NC} HTTP Version Not Supported" ;;
         *) status="${RED}HTTP Status: Undefined: ${status} ${NC}" ;;
  esac
  echo -e $status
}

function check () {
  serverName=$1;
  serverUrl=$2;
  httpCode=$(curl -k -m $TIMEOUT_SEC -o /dev/null -s -w "%{http_code}"  $serverUrl);
  if [ $httpCode -eq '200' ]
    then
      httpResponse=$(curl -k -m $TIMEOUT_SEC -s -w "%{http_code}"  $serverUrl);
      version=$(xmllint --html --xpath '//div[@id="copyright"]' - <<<"$httpResponse"| awk -F"[()]" '/\(/ {print $2}')
      echo -e "${serverName} $(mapCode $httpCode) ${GRE} $version ${NC}";
    else
      echo -e "${serverName} $(mapCode $httpCode) using url ${serverUrl} ";
  fi

}

check "localhost   " "http://localhost:8080/zsv/anmeldung";
check "C nightly   " "http://10.61.63.14:8081/zsv/anmeldung";
check "C playground" "http://10.61.63.22:8080/zsv/anmeldung";
check "C schulung  " "http://10.61.63.25:8080/zsv/anmeldung";
check "C UAG       " "http://10.61.63.24:8081/zsv/anmeldung";
check "R TEST      " "https://lschutw002.lr.landsh.de/zsv/anmeldung";
check "R Stage LB  " "https://school-sh-stage.lr.landsh.de/zsv/anmeldung";
check "R Stage 1   " "https://lschuqw001.lr.landsh.de/zsv/anmeldung";
check "R Stage 2   " "https://lschuqw002.lr.landsh.de/zsv/anmeldung";
check "R Prod  LB  " "https://school-sh.lr.landsh.de/zsv/anmeldung";
check "R Prod  1   " "https://lschupw002.lr.landsh.de/zsv/anmeldung";
check "R Prod  2   " "https://lschupw003.lr.landsh.de/zsv/anmeldung";



