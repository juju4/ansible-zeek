#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

rolesdir=$(dirname $0)/..

[ ! -d $rolesdir/juju4.maxmind ] && git clone https://github.com/juju4/ansible-maxmind $rolesdir/juju4.maxmind
[ ! -d $rolesdir/juju4.redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat-epel
[ ! -d $rolesdir/juju4.ipsumdump ] && git clone https://github.com/juju4/ansible-ipsumdump $rolesdir/juju4.ipsumdump
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.bro-ids ] && ln -s ansible-bro-ids $rolesdir/juju4.bro-ids
[ ! -e $rolesdir/juju4.bro-ids ] && cp -R $rolesdir/ansible-bro-ids $rolesdir/juju4.bro-ids

## don't stop build on this script return code
true

