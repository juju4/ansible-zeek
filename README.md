[![Build Status](https://travis-ci.org/juju4/ansible-bro-ids.svg?branch=master)](https://travis-ci.org/juju4/ansible-bro-ids)

# Bro-ids ansible role

Ansible role to setup Bro IDS
https://www.bro.org

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0

### Operating systems

Verified with kitchen against ubuntu14 and centos7

## Example Playbook

Just include this role in your list.
For example

```
- hosts: server
  roles:
    - bro-ids

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
## bro.org package location
bro_prefix: /opt/bro
#bro_prefix: /usr/local

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
bro_archive_md5: b0768ba77e6347d77a20e595f7eee120


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

* role is not idempotent, mostly broctl
* doing travis test with docker to do multiple distribution brings issues with mysql so for now, sticking to ubuntu trusty test only.

## License

BSD 2-clause



