Ansible role: Containerized CoreDNS
===================================

Role to run [CoreDNS](https://coredns.io) server using Docker

> **!! WARNING: !!** This role installs **Python 3** and [**Docker SDK for Python**](https://docker-py.readthedocs.io/en/stable/) packages to the target host(s) automatically!

Requirements
------------

N/A

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for the full variable list and their description

Dependencies
------------

Collections:
- [community.docker](https://galaxy.ansible.com/community/docker)

Roles:
- [vi7.docker](https://galaxy.ansible.com/vi7/docker)

Example Playbook
----------------

```yaml
---
- hosts: servers
  tasks:
  - name: "Include coredns"
    include_role:
      name: "vi7.coredns"
    vars:
      coredns_extra_plugins:
      - errors
      - loadbalance
      - reload
      - prometheus
      coredns_upstream_servers: 1.1.1.1 1.0.0.1
      coredns_zonefiles:
      - path: files/db.example.com
        zone: example.com
      - path: files/db.reverse
        zone: 1.0.10.in-addr.arpa

```

Some examples of the RFC 1035-style (BIND) zone files could be found under the [files](files/) dir

Development
-----------

### Role testing

Script [test.sh](test.sh) activates Python virtualenv, installs all the required Python packages and executes linter.

More comprehensive functional tests must be executed manually like follows (after running `./test.sh`):
```bash
source venv/bin/activate
molecule test
```

Author Information
------------------

[vi7](https://github.com/vi7)
