OCN_USER=dizabel
LIVE_ACCOUNT=672031754746
NONLIVE_ACCOUNT=280925034854
DR_NONLIVE_ACCOUNT=845613145306
DR_LIVE_ACCOUNT=086693214032
SCALE_LIVE_ACCOUNT=399451824870
SCALE_NONLIVE_ACCOUNT=705939861877
SCALE_INFRASTRUCTURE_ACCOUNT=060313587414
SPOC_LIVE_ACCOUNT=787821785757
SPOC_NONLIVE_ACCOUNT=925522540492
alias swamp-qsmp-live-developer='swamp "$@" -account $LIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-live-developer -target-role developer'
alias swamp-qsmp-live-admin='swamp "$@" -account $LIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-live-admin -target-role admin'
alias swamp-qsmp-nonlive-developer='swamp "$@" -account $NONLIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-nonlive-developer -target-role developer'
alias swamp-qsmp-nonlive-admin='swamp "$@" -account $NONLIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-nonlive-admin -target-role admin'
alias swamp-qsmp-dr-nonlive-admin='swamp "$@" -account $DR_NONLIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-dr-nonlive-admin -target-role admin'
alias swamp-qsmp-dr-live-admin='swamp "$@" -account $DR_LIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile qsmp-dr-live-admin -target-role admin'
alias swamp-scale-nonlive-admin='swamp "$@" -account $SCALE_NONLIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile scale-nonlive-admin -target-role admin'
alias swamp-scale-live-admin='swamp "$@" -account $SCALE_LIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile scale-live-admin -target-role admin'
alias swamp-scale-infrastructure-admin='swamp "$@" -account $SCALE_INFRASTRUCTURE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile scale-infrastructure-admin -target-role admin'
alias swamp-spoc-live-admin='swamp "$@" -account $SPOC_LIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile spoc-live-admin -target-role admin'
alias swamp-spoc-nonlive-admin='swamp "$@" -account $SPOC_NONLIVE_ACCOUNT -mfa-device arn:aws:iam::027617375449:mfa/$OCN_USER -target-profile spoc-nonlive-admin -target-role admin'
alias swamp-all-renew='swamp-qsmp-live-developer -renew & disown && sleep 1 && \
  swamp-qsmp-live-admin -renew & disown && sleep 1 && \
  swamp-qsmp-nonlive-developer -renew & disown && sleep 1 && \
  swamp-qsmp-nonlive-admin -renew & disown && sleep 1 && \
  swamp-qsmp-dr-nonlive-admin -renew & disown && sleep 1 && \
  swamp-qsmp-dr-live-admin -renew & disown && sleep 1 && \
  swamp-scale-live-admin -renew & disown && sleep 1 && \
  swamp-scale-nonlive-admin -renew & disown && sleep 1 && \
  swamp-scale-infrastructure-admin -renew & disown && \
  swamp-spoc-live-admin -renew & disown && sleep 1 && \
  swamp-spoc-nonlive-admin -renew & disown && sleep 1 && \
  (sleep 10h; killall -9 swamp) & disown'
