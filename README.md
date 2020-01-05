[![Build Status - Master](https://travis-ci.org/juju4/ansible-zeek.svg?branch=master)](https://travis-ci.org/juju4/ansible-zeek)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-zeek.svg?branch=devel)](https://travis-ci.org/juju4/ansible-zeek/branches)

# Zeek ansible role

Ansible role to setup [Zeek](https://www.zeek.org/), previously Bro IDS

Installation from
* [Opensuse repository](https://software.opensuse.org/download.html?project=security%3Azeek&package=zeek) (rpm or deb)(default)
* SecurityOnion repository (precise or trusty only)
* source

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.2
 * 2.5
 * 2.9

### Operating systems

Tested on Ubuntu 14.04, 16.04, 18.04, Centos 7. Kitchen test vagrant or lxd, Travis.

## Example Playbook

Just include this role in your list.
For example

```
- hosts: server
  roles:
    - juju4.zeek

```

?Some nrpe commands are included to help for monitoring.

Post-install check
```
$ sudo /opt/bro/bin/broctl
[BroControl] > install
[BroControl] > diag
```

## Variables

There is a good number of variables to set the different settings.
Some like password should be stored in ansible vault for production systems at least.

```
bro_mode: alone
#bro_mode: manager
#bro_mode: node
#bro_manager: 10.0.0.10
#bro_nodes:
#   - 10.0.0.11
#   - 10.0.0.12
#bro_nodes_if: eth0

## Only available for Ubuntu 12.04 (EOL Apr 2017), has pfring
use_securityonion_deb: false
## pfring/high network performance = build source
bro_w_pfring: false
## for source install
force_source_build: false
bro_v: 2.4
bro_archive_sha256: 740c0d0b0bec279c2acef5e1b6b4d0016c57cd02a729f5e2924ae4a922e208b2


## mysql setup for passivedns
mysql_user: root
mysql_root_password: mysql_root_pass_to_change_or_get_lost
mysql_old_root_password:
mysql_pdns_user: pdns
mysql_pdns_pass: pdns_pass_to_change_or_get_lost
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju.zeek
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.zeek/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* At May 2016, kitchen tests are validated. Travis still have issues (Read-only filesystem. Huh?) and some ansible variable (ansible_default_ipv4) not set
* role is not idempotent, mostly broctl
* "Error bro: capstats failed (Host 127.0.0.1 is not alive)" (/opt/bro/logs/stats/stats.log)
* Monit: bro_rc and bro process falls in "Not monitored" state so no automatic restart

## License

BSD 2-clause



