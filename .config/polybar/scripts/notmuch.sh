#!/usr/bin/env bash

work_normal=$(notmuch count tag:unread and tag:today and tag:bevuta)
work_ceo=$(notmuch count tag:unread and tag:today and tag:bevuta-CEO)
private=$(notmuch count tag:inbox and tag:unread and tag:today and not tag:bevuta)
printf "%s-%s-%s" ${private} ${work_normal} ${work_ceo}
