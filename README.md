[![Build Status](https://travis-ci.org/juju4/ansible-bro-ids.svg?branch=master)](https://travis-ci.org/juju4/ansible-bro-ids)

# Bro-ids ansible role

Ansible role to setup Bro IDS
https://www.bro.org

Installation from
* Opensuse repository - 2.5 (rpm or deb)(default)
* SecurityOnion repository (precise or trusty only)
* source - 2.5

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.2

### Operating systems

Ubuntu 14.04, 16.04 and Centos7

## Example Playbook

Just include this role in your list.
For example

```
- hosts: server
  roles:
    - juju4.bro-ids

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
$ cd /path/to/roles/mig
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/mig/test/vagrant
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



