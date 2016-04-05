#!/usr/bin/env bats
#

#
# Idempotence test
# from https://github.com/neillturner/kitchen-ansible/issues/92
#

## FIXME! known failure currently
#@test "Second run should change nothing" {
#    run bash -c "ansible-playbook -i /tmp/kitchen/hosts /tmp/kitchen/default.yml -c local | grep -q 'changed=0.*failed=0' && exit 0 || exit 1"
#    [ "$status" -eq 0 ]
#}

