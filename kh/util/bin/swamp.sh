OCN_USER=dizabel
ROOT_ACCOUNT_ID=027617375449


# Dietmar
# arn:aws:iam::110776252984:mfa/dietmar-cloud

alias swamp-dietmar-cloud='unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account 110776252984                  -mfa-device arn:aws:iam::110776252984:mfa/Dietmar       -target-profile dietmar-target-profile -profile dietmar-profile'


# DV_LIVE=948404762416
# DV_NONLIVE=316186851731
# alias swamp-dv-live-developer='   unset AWS_PROFILE ; swamp "$@" -account $DV_LIVE      -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile dr-live-developer    -target-role developer ; export AWS_PROFILE=dr-live-developer    ;'
# alias swamp-dv-nonlive-developer='unset AWS_PROFILE ; swamp "$@" -account $DV_NONLIVE   -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile dr-nonlive-developer -target-role developer ; export AWS_PROFILE=dr-nonlive-developer ;'
# alias swamp-dv-live-admin='       unset AWS_PROFILE ; swamp "$@" -account $DV_LIVE      -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile dr-live-admin        -target-role admin     ; export AWS_PROFILE=dr-live-admin        ;'
# alias swamp-dv-nonlive-admin='    unset AWS_PROFILE ; swamp "$@" -account $DV_NONLIVE   -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile dr-nonlive-admin     -target-role admin     ; export AWS_PROFILE=dr-nonlive-admin     ;'

PRIME_LIVE=585322426445
PRIME_NONLIVE=373401691505

PRIME_DRLIVE=974557510689
PRIME_DRNONLIVE=881044812439

PRIME_INFRA_ADMIN=335373990591

# alias swamp-prime-live-developer='   unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_LIVE        -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-live-developer    -target-role developer ; export AWS_PROFILE=prime-live-developer    ; export AWS_DEFAULT_PROFILE=prime-live-developer    ;'
# alias swamp-prime-nonlive-developer='unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_NONLIVE     -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-nonlive-developer -target-role developer ; export AWS_PROFILE=prime-nonlive-developer ; export AWS_DEFAULT_PROFILE=prime-nonlive-developer ;'
alias   swamp-prime-live-admin='       unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_LIVE        -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-live-admin        -target-role admin     ; export AWS_PROFILE=prime-live-admin        ; export AWS_DEFAULT_PROFILE=prime-live-admin        ;'
alias   swamp-prime-nonlive-admin='    unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_NONLIVE     -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-nonlive-admin     -target-role admin     ; export AWS_PROFILE=prime-nonlive-admin     ; export AWS_DEFAULT_PROFILE=prime-nonlive-admin     ;'
alias   swamp-dr-live-admin='          unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_DRLIVE      -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-drlive-admin      -target-role admin     ; export AWS_PROFILE=prime-drlive-admin      ; export AWS_DEFAULT_PROFILE=prime-drlive-admin      ;'
alias   swamp-dr-nonlive-admin='       unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_DRNONLIVE   -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-drnonlive-admin   -target-role admin     ; export AWS_PROFILE=prime-drnonlive-admin   ; export AWS_DEFAULT_PROFILE=prime-drnonlive-admin   ;'
alias   swamp-infra-admin='            unset AWS_PROFILE ; unset AWS_DEFAULT_PROFILE ; swamp "$@" -account $PRIME_INFRA_ADMIN -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile prime-infra-admin       -target-role admin     ; export AWS_PROFILE=prime-infra-admin       ; export AWS_DEFAULT_PROFILE=prime-infra-admin       ;'

# See github.com -> Settings->Developer settings->Pers. access tokens, needed to rotate keys
# export GITHUB_TOKEN=abc
# export GITHUB_OWNER=otto-ec
# Moved to .bashrc

#alias swamp-qsmp-live-developer='       unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $LIVE_ACCOUNT                 -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-live-developer        -target-role developer ; export AWS_PROFILE=qsmp-live-developer        ; export AWS_ENV=live   ;'
#alias swamp-qsmp-live-admin='           unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $LIVE_ACCOUNT                 -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-live-admin            -target-role admin     ; export AWS_PROFILE=qsmp-live-admin            ; export AWS_ENV=live   ;'
#alias swamp-qsmp-nonlive-developer='    unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $NONLIVE_ACCOUNT              -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-nonlive-developer     -target-role developer ; export AWS_PROFILE=qsmp-nonlive-developer     ; export AWS_ENV=nonlive;'
#alias swamp-qsmp-nonlive-admin='        unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $NONLIVE_ACCOUNT              -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-nonlive-admin         -target-role admin     ; export AWS_PROFILE=qsmp-nonlive-admin         ; export AWS_ENV=nonlive;'
#alias swamp-qsmp-dr-nonlive-admin='     unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $DR_NONLIVE_ACCOUNT           -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-dr-nonlive-admin      -target-role admin     ; export AWS_PROFILE=qsmp-dr-nonlive-admin      ; export AWS_ENV=nonlive;'
#alias swamp-qsmp-dr-live-admin='        unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $DR_LIVE_ACCOUNT              -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile qsmp-dr-live-admin         -target-role admin     ; export AWS_PROFILE=qsmp-dr-live-admin         ; export AWS_ENV=live   ;'
#alias swamp-scale-nonlive-admin='       unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $SCALE_NONLIVE_ACCOUNT        -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile scale-nonlive-admin        -target-role admin     ; export AWS_PROFILE=scale-nonlive-admin        ; export AWS_ENV=nonlive;'
#alias swamp-scale-live-admin='          unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $SCALE_LIVE_ACCOUNT           -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile scale-live-admin           -target-role admin     ; export AWS_PROFILE=scale-live-admin           ; export AWS_ENV=live   ;'
#alias swamp-scale-infrastructure-admin='unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $SCALE_INFRASTRUCTURE_ACCOUNT -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile scale-infrastructure-admin -target-role admin     ; export AWS_PROFILE=scale-infrastructure-admin ; export AWS_ENV=live   ;'
#alias swamp-spoc-live-admin='           unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $SPOC_LIVE_ACCOUNT            -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile spoc-live-admin            -target-role admin     ; export AWS_PROFILE=spoc-live-admin            ; export AWS_ENV=live   ;'
#alias swamp-spoc-nonlive-admin='        unset AWS_PROFILE ; unset AWS_ENV ; swamp "$@" -account $SPOC_NONLIVE_ACCOUNT         -mfa-device arn:aws:iam::$ROOT_ACCOUNT_ID:mfa/$OCN_USER -target-profile spoc-nonlive-admin         -target-role admin     ; export AWS_PROFILE=spoc-nonlive-admin         ; export AWS_ENV=nonlive;'

#alias swamp-all-renew='swamp-qsmp-live-developer        -renew & disown && sleep 1 && \
#                       swamp-qsmp-live-admin            -renew & disown && sleep 1 && \
#                       swamp-qsmp-nonlive-developer     -renew & disown && sleep 1 && \
#                       swamp-qsmp-nonlive-admin         -renew & disown && sleep 1 && \
#                       swamp-qsmp-dr-nonlive-admin      -renew & disown && sleep 1 && \
#                       swamp-qsmp-dr-live-admin         -renew & disown && sleep 1 && \
#                       swamp-scale-live-admin           -renew & disown && sleep 1 && \
#                       swamp-scale-nonlive-admin        -renew & disown && sleep 1 && \
#                       swamp-scale-infrastructure-admin -renew & disown && sleep 1 && \
#                       swamp-spoc-live-admin            -renew & disown && sleep 1 && \
#                       swamp-spoc-nonlive-admin         -renew & disown && sleep 1 && \
#                       (sleep 10h; killall -9 swamp) & disown'
