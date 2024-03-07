#!/bin/bash

# URLs in einem Array
urls=(
"https://vimeo.com/user69201289/review/860154098/cb1ac19b89"
"https://vimeo.com/user69201289/review/860179221/cda9151e5c"
"https://vimeo.com/user69201289/review/860206044/23e4c63511"
"https://vimeo.com/user69201289/review/860208192/ec0212d2d4"
"https://vimeo.com/user69201289/review/860226780/3a3b850493"
"https://vimeo.com/user69201289/review/859910088/fcbd15f704"
"https://vimeo.com/user69201289/review/859974657/c539c0b9f6"
"https://vimeo.com/user69201289/review/860014197/b00c2aebb1"
"https://vimeo.com/user69201289/review/860018435/39ae3da849"
"https://vimeo.com/user69201289/review/860049081/46e4473d3c"
"https://vimeo.com/user69201289/review/860087913/344145df5d"
"https://vimeo.com/user69201289/review/860101390/93a8d17d0b"
"https://vimeo.com/user69201289/review/860128196/47c76f6f22"
"https://vimeo.com/user69201289/review/860277033/05e37e70a6"
"https://vimeo.com/user69201289/review/858053733/b8da224109"
"https://vimeo.com/user69201289/review/858081057/650c279648"
"https://vimeo.com/user69201289/review/858108573/1f0824cb03"
"https://vimeo.com/user69201289/review/857725316/b71e1676f8"
"https://vimeo.com/user69201289/review/857739479/06028508de"
"https://vimeo.com/user69201289/review/857747042/5f168f98de"
"https://vimeo.com/user69201289/review/857748302/2560336df1"
"https://vimeo.com/user69201289/review/857760176/509ab08b6d"
"https://vimeo.com/user69201289/review/857761143/e0bd5f3ae0"
"https://vimeo.com/user69201289/review/857768717/ed972c90d4"
"https://vimeo.com/user69201289/review/857948112/d8aad6940e"
)

# Die erwartete Anzahl der MP4-Dateien entspricht der Länge des URL-Arrays
expected_mp4_count=${#urls[@]}

# Funktion um Dateien außer .mp4 und .sh zu löschen
clean_files() {
    find . -type f ! -name "*.mp4" ! -name "*.sh" -exec rm {} \;
}

# Basis-Befehl für yt-dlp
#base_command=("yt-dlp --video-password ramana ")
base_command=(yt-dlp --legacy-server-connect --no-check-certificate --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36')


while true; do
    # Zähle MP4-Dateien im aktuellen Verzeichnis
    mp4_count=$(find . -type f -name "*.mp4" | wc -l)

    # Wenn die Anzahl der MP4-Dateien der erwarteten Anzahl entspricht, breche die Schleife ab
    if (( mp4_count >= expected_mp4_count )); then
        break
    fi

    # Lösche Dateien, die nicht .mp4 oder .sh sind
    clean_files

    # Iteriere durch URLs und rufe yt-dlp auf
    for url in "${urls[@]}"; do
        $base_command $url
    done
done
