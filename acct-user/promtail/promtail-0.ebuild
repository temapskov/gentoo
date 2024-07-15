# Ebuild файл для пользователя promtail

EAPI=8

inherit acct-user

DESCRIPTION="User for Promtail"

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( promtail )
ACCT_USER_HOME=/var/lib/promtail
ACCT_USER_HOME_PERMS=0770
ACCT_USER_SHELL=/sbin/nologin

acct-user_add_deps
