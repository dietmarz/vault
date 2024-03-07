
# --- filesystem ---
alias cddietmar="cd ~/dietmar"
alias cdDownloads="cd ~/Downloads && ls -lrtha"
alias cdoffice="cd ~/project/office"
alias cdkh="cd ~/project/kh"
alias cdserver="cd ~/project/server"
alias ll='ls -lrtha'
alias lastModified='find . -type f -printf "%T@ %p\n"| sort -n | cut -d\  -f2-'
alias findDoublicates='find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD'
alias createMd5='find . ! -empty -type f -exec md5sum {} + | tee files.md5'
alias cdproject="cd ~/project/"
alias c="caja . &"
alias backup='rsync -avxtHAX --info=progress2 --delete --backup --backup-dir=_trash/$(date "+%Y_%m_%d-%H_%M_%S") --exclude=_trash'
mcd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# --- ssh ---
alias server="ssh dietmar@qualitycodeconsulting.de"
alias office="ssh dietmar@office"
# alias server="ssh dietmar@server"

# --- git ---
alias add="git add . && st"
alias amend="git commit --amend --no-edit"
alias dev="git checkout development && st && rebase && git lg -1"
alias intermediate="git add . && git commit -m intermediate"
alias st="git status -s"
alias lg="git lg -10"
alias log="git log -3"
alias master="git checkout master && rebase && st && git lg -1"
alias push="git push && git lg -1"
alias pushf="git push -f && git lg -1"
alias pushu="git push -u && git lg -1"
alias rebase="git pull --all --rebase --autostash"
alias rebaseToDev="git fetch --all && git rebase --autostash origin/development"
alias resetBranch="git reset --hard @{u}"
alias showFilesForCommit='git show --pretty="" --name-only '
alias showAllDeletedFiles='git log --diff-filter=D --name-only --oneline'
alias vv="git branch -vv"
# alias gitkdev="gitk origin/development `git branch --show-current` &"

# --- docker ---
alias d='docker'
alias dc='docker-compose '
alias dcu='docker-compose up --build '
alias dcls="docker container ls"
alias ds="docker stats"
alias d-IPs="docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'"
alias rmContainers='docker container rm -f $(docker container ls -aq)'
alias stopContainers='docker container stop $(docker container ls -aq)'
alias rmImages='docker rmi $(docker images --format "{{.Repository}}:{{.Tag}}")'
alias rmVolumes="docker volume ls --format '{{.Name}}' | xargs -i docker volume rm --force {} ; echo 'Volumes left:' ; docker volume ls"
dc-restart(){
 docker-compose stop $@;
 docker-compose rm -f -v $@;
 dcu $@;
}

alias nextCloudDo="docker exec -it -u www-data nextcloud-app /var/www/html/occ "

# --- intellij ---
alias i='/opt/idea/bin/idea.sh'
alias addAngular="i /home/dietmar/project/kh/it/web/angular/angular.adoc"

# --- maven ---
alias mci="mvn clean install"
alias mcis="mvn clean install  -Dmaven.test.skip=true"
alias dependencyConflicts='mvn -Dverbose dependency:tree | less --pattern=conflict'

# --- MySQL ---
alias ms="mysql --host=127.0.0.1 --user=root --password=root"
alias mssd='ms -e "show databases;"'
alias importSql='cat *.sql | ms'

# --- misc tools ---
alias less="less -I"
alias killtomcat="ps -eaf | grep tomcat | grep -v grep | awk '{print \$2}' | xargs -i kill -9 {}"
alias cpr="rsync -a --info=progress2 --no-i-r --human-readable "

# export webdriver_gecko_driver=/opt/selenium-webdriver/firefox-driver
# export webdriver_chrome_driver=/opt/selenium-webdriver/chrome-driver

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '



alias cdproject="cd ~/project"
alias cdschule="cd ~/project/schulverwaltung"
alias cdgui="cd ~/project/gui-tests"
alias cdcopy="cd ~/project/copy-schulverwaltung"
alias cdcustomer="cd ~/cloud/customer/dataport"

alias redeploy="rm redeploy.log; ant webapp.redeploy.and.debug | tee redeploy.log"
alias redeployCleanSetup="rm redeploy.log; ant clean setup webapp.redeploy.and.debug | tee redeploy.log"
alias java11='export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ ; export PATH="/usr/lib/jvm/java-11-openjdk-amd64/bin/:${PATH}"' 
alias java8='export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/ ; export PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin/:${PATH}"' 

# Abschalten des proxy nur für dieses Project
alias disableProxy="git config --add remote.origin.proxy ''"
alias proxy='export https_proxy="http://141.91.176.130:80"'

alias runIntTest="ant clean testdata.refresh run.integration-tests"

alias adminKennwort="echo !adminkennwort1"
alias hauptpasswort="echo SVSSH@Dataport20!"
