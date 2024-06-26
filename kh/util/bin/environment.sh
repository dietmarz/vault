# This file needs to be sourced in order to run all other files

# Windows Beispiel
if [ "$HOSTNAME" == "NLEIH007" ]
then
  export ENV_VAULT="c:/project/vault"
  export ENV_EDITOR="c:/opt/intellij/bin/idea64.exe"
  export ENV_CALCULATOR="c:/Program Files/Microsoft Office/root/Office16/EXCEL.EXE"
  export ENV_FILE_LISTER="ls"
  export ENV_FILE_LISTER_ARG="-lrth"
  export ENV_PYTHON="py.exe"
  export ENV_SKIP_VALIDATION="true"
fi


#  || [ "$HOSTNAME" == "server" ] Fehlt
if [ "$HOSTNAME" == "p5470" ] || [ "$HOSTNAME" == "e5401" ] || [ "$HOSTNAME" == "labor" ] || [ "$HOSTNAME" == "cinnamon-vm" ] || [ "$HOSTNAME" == "dza-pps" ]
then
  export ENV_VAULT="/home/dietmar/cloud/Notes"
  export ENV_EDITOR="/opt/idea/bin/idea.sh"
  export ENV_CALCULATOR="/usr/bin/soffice --calc"
  export ENV_FILE_LISTER="tree"
  export ENV_FILE_LISTER_ARG=""
  export ENV_PYTHON="python3"
fi

if [ "$HOSTNAME" == "dza-pps" ]
then
  export ENV_VAULT="/home/dietmar/project/vault"
  export ENV_SKIP_VALIDATION="true"
fi

if [ "$HOSTNAME" == "p5470" ]
then
  export ENV_OFFICE="/home/dietmar/cloud/office/"
fi


if ! [ -d "$ENV_VAULT" ]
then
    echo ENV_VAULT does not point to the vault directory: $ENV_VAULT
fi

if ! [ -f "$ENV_EDITOR" ]
then
    echo ENV_EDITOR does not point to the idea editor executable: $ENV_EDITOR
fi

if [ -f "${ENV_VAULT}/kh/util/bin/password.ignore.sh" ]; then
    source "${ENV_VAULT}/kh/util/bin/password.ignore.sh"
fi

# Extrahiere den Pfad ohne die Argumente --calc
if ! [ -f "$(echo $ENV_CALCULATOR | sed 's/ -.*//')" ]
then
    echo ENV_CALCULATOR does not point to a calculator executable: $ENV_CALCULATOR
fi

SERVER_BIN=/home/dietmar/project/server/bin
if [ -d "$SERVER_BIN" ]; then
    export PATH=${PATH}:${SERVER_BIN}
fi

export PATH=${PATH}:${ENV_VAULT}/kh/util/bin
export PATH=${PATH}:${ENV_EDITOR%/*}


# --- filesystem ---
alias largeDirs='du -ah --max-depth=1 . | sort -h'
alias removeSpacesInFiles='for f in *\ *; do mv "$f" "${f// /-}"; done'
alias cddietmar="cd ~/dietmar"
alias cdvault="cd $ENV_VAULT"
alias cdnotes=cdvault
alias cdDownloads="cd ~/Downloads && ls -lrtha"
alias cdoffice="cd ~/cloud/office"
alias cdkh="cd $ENV_VAULT/kh/util/bin"
alias cdserver="cd ~/project/server"
alias cdkonto="cd ~/cloud/office/Finanz/Konten/Kontoauszug"
alias ll='ls -lrtha'
alias lastModified='find . -type d \( -name .git -o -name .idea \) -prune -o -type f -printf "%T@ %p\n" | sort -n | cut -d" " -f2-'
alias findDoublicates='find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD'
alias createMd5='find . ! -empty -type f -exec md5sum {} + | tee files.md5'
alias cdproject="cd ~/project/"
alias cdsandbox="cd ~/project/sandbox/"
alias cdcloud="cd ~/cloud/"
alias yt-mp4='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" '

# alias backup='rsync -avxtHAX --info=progress2 --delete --backup --backup-dir=_trash/$(date "+%Y_%m_%d-%H_%M_%S") --exclude=_trash'
mcd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# --- ssh ---
alias server="ssh -X dietmar@qualitycodeconsulting.de"
alias office="ssh dietmar@office"
# alias server="ssh dietmar@server"

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
alias pushf="git push --force --all && git push --force --tags && git lg -1 && st"
alias pushu="git push -u && git lg -1"
alias rebase="git pull --all --rebase --autostash --prune && st"
alias rebaseToDev="git fetch --all --prune && git rebase --autostash origin/development"
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

# --- android ---
alias adb-offline="adb shell svc data disable && adb shell svc wifi disable"
alias adb-run-worker="adb shell am broadcast -p de.hermes.multiapp -a de.hermes.multiapp.action.RUN_WORKER -e type worker_chain"

dc-restart(){
 docker-compose stop $@;
 docker-compose rm -f -v $@;
 dcu $@;
}

#function check_intellij_terminal() {
#    if [ -z "$IS_INTELLIJ_SHELL" ]; then
#        # Ermitteln des Befehls des übergeordneten Prozesses in einem Aufruf
#        local parent_command=$(ps -o cmd= --ppid $(ps -o ppid= -p $$))
#
#        # Überprüfen, ob der Befehl Hinweise auf 'intellij' enthält
#        if [[ "$parent_command" =~ intellij ]]; then
#            export IS_INTELLIJ_SHELL="true"
#        else
#            export IS_INTELLIJ_SHELL="false"
#        fi
#    fi
#}
#check_intellij_terminal

alias nextcloudDo="docker exec -u www-data nextcloud-app /var/www/html/occ "
alias nextcloudLog='ssh -t -X dietmar@qualitycodeconsulting.de "sudo bash -c '\''less +F /vol/nextcloud/data/nextcloud.log'\''"'

# --- intellij ---
# alias i='/opt/idea/bin/idea.sh'

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
alias yt-mp3="yt-dlp -f 'ba' -x --audio-format mp3 "

# export webdriver_gecko_driver=/opt/selenium-webdriver/firefox-driver
# export webdriver_chrome_driver=/opt/selenium-webdriver/chrome-driver

if [ "$HOSTNAME" != "NLEIH007" ]
then
  export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
fi

alias java11=' export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java8='  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64   ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java16=' export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java17=' export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java162='export JAVA_HOME=/opt/jdk/jdk-16.0.2                 ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
