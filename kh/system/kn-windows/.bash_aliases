# --- filesystem ---
alias removeSpacesInFiles='for f in *\ *; do mv "$f" "${f// /-}"; done'
alias cddietmar="cd /c/dietmar"
alias cddata="cd /c/data"
alias cdvault="cd ${ENV_VAULT}"
alias cdDownloads="cd /c/Users/dietmar.zabel/Downloads/ && ls -lrtha"
alias cdkh="cd /c/project/kh/util/bin"
alias ll='ls -lrtha'
alias lastModified='find . -type f -printf "%T@ %p\n"| sort -n | cut -d\  -f2-'
alias findDoublicates='find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD'
alias createMd5='find . ! -empty -type f -exec md5sum {} + | tee files.md5'
alias cdproject="cd /c/project/"
alias c="caja . &"
alias backup='rsync -avxtHAX --info=progress2 --delete --backup --backup-dir=_trash/$(date "+%Y_%m_%d-%H_%M_%S") --exclude=_trash'
alias cdcustomer="cd ~/cloud/customer/Otto"
cdd ()
{
  cd "/c/data/esp-$1"
}

mcd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}


# --- git ---
# alias add="git add . && st"
alias amend="git commit --amend --no-edit"
alias dev="git checkout develop && st && rebase && git lg -1"
alias intermediate="git add . && git commit -m intermediate"
alias st="git status -s"
alias lg="git lg -10"
alias log="git log -3"
alias authors="git shortlog -s -n --all --no-merges"
alias master="git checkout master && rebase && st && git lg -1"
alias develop="git checkout develop && rebase && st && git lg -1"
alias main="git checkout main && rebase && st && git lg -1"
alias push="git push && git lg -1"
alias pushf="git push -f && git lg -1 && st"
alias pushu="git push -u && git lg -1"
alias rebase="git pull --all --rebase --autostash --prune && st"
alias rebaseToDev="git fetch --all --prune && git rebase --autostash origin/develop"
alias rebaseToMaster="git fetch --all --prune && git rebase --autostash origin/master"
alias rebaseToMain="git fetch --all --prune && git rebase --autostash origin/main"
alias mergeNoCommit="git pull --all --rebase && git merge --no-commit --ff-only "
alias resetBranch="git reset --hard @{u}"
alias showFilesForCommit='git show --pretty="" --name-only '
alias showAllDeletedFiles='git log --diff-filter=D --name-only --oneline'
alias vv="git branch -vv && git branch -r"
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

alias nextcloudDo="docker exec -u www-data nextcloud-app /var/www/html/occ "

# --- intellij ---
# alias i='/opt/idea/bin/idea.sh'

# --- maven ---
alias mci="mvn clean install"
alias mcis="mvn clean install  -Dmaven.test.skip=true"
alias mct="mvn clean jar:jar jacoco:prepare-agent-integration failsafe:integration-test failsafe:verify"
alias msa="mvn spotless:apply && git status -s"
alias dependencyConflicts='mvn -Dverbose dependency:tree | less --pattern=conflict'

# --- MySQL ---
alias ms="mysql --host=127.0.0.1 --user=root --password=root"
alias mssd='ms -e "show databases;"'
alias importSql='cat *.sql | ms'

# --- misc tools ---
alias less="less -I"
alias killtomcat="ps -eaf | grep tomcat | grep -v grep | awk '{print \$2}' | xargs -i kill -9 {}"
alias cpr="rsync -a --info=progress2 --no-i-r --human-readable "
alias yt-mp3="yt-dlp -f 'ba' -x --audio-format mp3 "

# export webdriver_gecko_driver=/opt/selenium-webdriver/firefox-driver
# export webdriver_chrome_driver=/opt/selenium-webdriver/chrome-driver

alias java11=' export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java8='  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64   ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java16=' export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java17=' export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java162='export JAVA_HOME=/opt/jdk/jdk-16.0.2                 ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'

alias e="explorer"

