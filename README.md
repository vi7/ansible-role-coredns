Ansible role: Containerized CoreDNS
===================================

Role to run [CoreDNS](https://coredns.io) server using Docker

Requirements
------------

See [TODO:](#todo) section for steps which must be performed manually

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for the full variable list and their description

Dependencies
------------

TODO: check if dependencies are installed automatically from [meta/requirements.yml](meta/requirements.yml)

Collections:
- [community.docker](https://galaxy.ansible.com/community/docker)

Roles:
- [docker](https://github.com/vi7/ansible-role-docker)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

Development
-----------

### Role testing

Script [test.sh](test.sh) activates Python virtualenv, installs all the required Python packages and executes linter. More complex tests could be executed like following:
```bash
source venv/bin/activate
molecule test
```

> NOTE: symlink at `molecule/default/roles/monitoring_stack` points to the role itself, it's needed for the correct ansible-lint operation due to the role being imported rather than included inside `molecule/default/converge.yml`. Probably this won't be needed anymore when role is extracted to the standalone repo.

Author Information
------------------

[vi7](https://github.com/vi7)


TODO:
-----

- Disable a local `systemd-resolved` DNS stub listener. If `systemd-resolved.service` is enabled then create `/etc/systemd/resolved.conf.d/01-disable_dnsstub.conf`:
  ```conf
  [Resolve]
  DNSStubListener=no
  ```

  and `systemctl restart systemd-resolved.service`
