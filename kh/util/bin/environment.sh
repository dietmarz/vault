# This file needs to be sourced in order to run all other files

# Windows Beispiel
if [ "$HOSTNAME" == "DEXXXLPF458HGE" ] || [ "$HOSTNAME" == "DEW33687" ]
then
  export ENV_VAULT="c:/dietmar/vault"
  export ENV_EDITOR="c:/opt/idea/bin/idea64.exe"
  export ENV_FILE_LISTER="ls"
  export ENV_FILE_LISTER_ARG="-lrth"
  export ENV_PYTHON="py.exe"
fi

if [ "$HOSTNAME" == "DEW33687" ]
then
  export ENV_EDITOR="c:/opt/intellij/bin/idea64.exe"
fi

#  || [ "$HOSTNAME" == "server" ] Fehlt
if [ "$HOSTNAME" == "p5470" ] || [ "$HOSTNAME" == "e5401" ] || [ "$HOSTNAME" == "labor" ] || [ "$HOSTNAME" == "cinnamon-vm" ]
then
  export ENV_VAULT="/home/dietmar/vault"
  export ENV_EDITOR="/opt/idea/bin/idea.sh"
  export ENV_FILE_LISTER="tree"
  export ENV_FILE_LISTER_ARG=""
  export ENV_PYTHON="python3"
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

# --- filesystem ---
alias largeDirs='du -ah --max-depth=1 . | sort -h'
alias removeSpacesInFiles='for f in *\ *; do mv "$f" "${f// /-}"; done'
alias cddietmar="cd ~/dietmar"
alias cdvault="cd $ENV_VAULT"
alias cdDownloads="cd ~/Downloads && ls -lrtha"
alias cdoffice="cd ~/cloud/office"
alias cdkh="cd $ENV_VAULT/kh/util/bin"
alias cdserver="cd ~/project/server"
alias cdkonto="cd ~/cloud/office/Finanz/Konten/Kontoauszug"
alias ll='ls -lrtha'
alias lastModified='find . -type f -printf "%T@ %p\n"| sort -n | cut -d\  -f2-'
alias findDoublicates='find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD'
alias createMd5='find . ! -empty -type f -exec md5sum {} + | tee files.md5'
alias cdproject="cd ~/project/"
alias cdcloud="cd ~/cloud/"


# alias backup='rsync -avxtHAX --info=progress2 --delete --backup --backup-dir=_trash/$(date "+%Y_%m_%d-%H_%M_%S") --exclude=_trash'
alias cdcustomer="cd ~/cloud/customer/"
cdd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}

# --- ssh ---
alias server="ssh dietmar@qualitycodeconsulting.de"
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
alias listAuthors="git shortlog -s -n --all --no-merges"
alias master="git checkout master && rebase && st && git lg -1"
alias develop="git checkout develop && rebase && st && git lg -1"
alias main="git checkout main && rebase && st && git lg -1"
alias push="git push && git lg -1"
alias pushf="git push -f && git lg -1 && st"
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
dc-restart(){
 docker-compose stop $@;
 docker-compose rm -f -v $@;
 dcu $@;
}

alias nextCloudDo="docker exec -u www-data nextcloud-app /var/www/html/occ "

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

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

alias java11=' export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java8='  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64   ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java16=' export JAVA_HOME=/usr/lib/jvm/java-16-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java17=' export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64  ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
alias java162='export JAVA_HOME=/opt/jdk/jdk-16.0.2                 ; export PATH="${JAVA_HOME}/bin:${PATH}" ; `${JAVA_HOME}/bin/java -version`'
