REM +++ Anmeldeskript Ham MI +++

REM +++ Netzlaufwerke trennen +++
REM echo j|net use m: /del
echo j|net use n: /del
echo j|net use s: /del

REM  +++ Netzlaufwerke verbinden +++
net use m: /home
net use n: \\hamhcfp11.GER.win.int.kn\Groups_MI
net use s: \\hamhcfp11.GER.win.int.kn\scan.%username%


