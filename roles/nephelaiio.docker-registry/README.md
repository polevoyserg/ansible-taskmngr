nephelaiio.docker-registry
=========

[![Build Status](https://travis-ci.org/nephelaiio/ansible-role-docker-registry.svg?branch=master)](https://travis-ci.org/nephelaiio/ansible-role-docker-registry)

An [ansible role](https://galaxy.ansible.com/nephelaiio/docker-registry) to install and configure [Docker Registry](https://docs.docker.com/registry/)

Role Variables
--------------

Please refer to the [defaults file](/defaults/main.yml) for an up to date list of input parameters.

Dependencies
------------

By default this role does not depend on any external roles. If any such dependency is required please [add them](/meta/main.yml) according to [the documentation](http://docs.ansible.com/ansible/playbooks_roles.html#role-dependencies)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: servers
  roles:
     - { role: docker-registry docker-registry_packages: docker-registry }


Testing
-------

Please make sure your environment has [docker](https://www.docker.com) installed in order to run role validation tests. Additional python dependencies are listed in the [requirements file](/requirements.txt)

Role is tested against the following distributions (docker images):
  * Ubuntu Xenial
  * CentOS 7
  * Debian Jessie
  * Arch Linux

To test the role from sources using the command line with molecule run:
```
molecule test
```

Please review the [documentation](http://docs.ansible.com/ansible/galaxy.html#setup-travis-integrations) in order to add continuous integration for the role using [Travis CI](https://travis-ci.org). Role configuration is provided in the [Travis-CI configuration file](/travis.yml)

License
-------

This project is licensed under the terms of the [MIT License](/LICENSE)
