Development Environment
=======================

To make developing F5 Ansible modules easier, this document covers the development
tools that are used. While these tools are not a requirement, they have been chosen
because they make certain tasks significantly easier.

Getting Started
===============

We assume that you are working on a \*nix, or \*nix-like environment. The workstation
we'll be using in the examples is a Mac running Sierra (10.12.6). Some of the steps
will not be relevant to other environments. When that happens, it will be noted.

Amongst the topics of this document are the following

* Choosing an IDE
* REST communication
* Virtualization tools
* Docker
* Getting the source
* sudo ifconfig lo0 -alias 1.2.3.4

This document ultimately serves as a gateway to all the other development related
documents on this site. You will be unable to follow the other development documents
without having the setup outlined here in place.

Choosing an IDE
---------------

The IDE that the Ansible modules are written in is PyCharm.

  * https://www.jetbrains.com/pycharm/download/

The developers use the Professional edition, but there is also a Community edition
available to you as well.

Other editors can be used as you see fit, but the above editor is used in this
document.

A vanilla installation of PyCharm is sufficient.

With an editor in place, it is time for you to get a tool that will facilitate your
ability to speak with the F5 device's REST API. For this, let's proceed to the
next section.

REST communication
------------------

There are a variety of tools that can be used to introspect a REST API, but Postman
is the one that we used for the F5 Ansible modules.

This tool is used in two ways

* As a way to communicate with F5 devices during development
* As a way for contributors to provide API workflows to the Ansible module developers

Postman can be downloaded from the following URL.

* https://www.getpostman.com/

It comes in two parts. First, there is the `postman` tool itself which is a GUI tool
that you can use to interact with remote REST APIs. Second, there is a CLI tool
called `newman` which can be used to run batches of API calls. These batches are
usually in the form of what Postman refers to as "Collections".

We do not use `newman`.

Docker
------

Since the F5 Ansible modules are written in python, it's required that we have
the different installations of Python available to us. To do this, we provide
a `docker-compose.yaml` file that has all the necessary Python environments.

`docker-compose` *should* come with docker by default. If not, you can install it
by following the instructions here.

* https://docs.docker.com/compose/install/

To make use of this requires the following two steps.

First, you will need to build the initial containers. Rebuilding containers does
not need to be done frequently; only if we change the base `Dockerfile`.

To build the initial container, you will want to know what the existing Python
environments that we support are.

You can get this information with the following command

* `docker-compose -f devtools/docker-compose.yaml config --services`

For example,

.. code-block:: bash

   (ansible-dev) SEA-ML-RUPP1:f5-ansible trupp$ docker-compose -f devtools/docker-compose.yaml config --services
   docker-compose -f devtools/docker-compose.yaml config --services
   py2.7.10
   py3.5.4
   py3.6.2
   (ansible-dev) SEA-ML-RUPP1:f5-ansible trupp$

Once you have chosen the environment that you want, you can proceed to build.
Suppose you were interested in Python 3.6.2. You could build that development
environment with the following command.

* `docker-compose -f devtools/docker-compose.yaml build py3.6.2`

For example,

.. code-block:: bash

   (ansible-dev) SEA-ML-RUPP1:f5-ansible trupp$ docker-compose -f devtools/docker-compose.yaml build --no-cache py3.6.2
   docker-compose -f devtools/docker-compose.yaml build py3.6.2
   Building py3.6.2
   Step 1/11 : FROM python:2.7
    ---> 416af6c21fa5
   ...
   Removing intermediate container 32dce77d8634
   Step 11/11 : CMD ['/bin/bash']
    ---> Running in dc5557ae0583
    ---> f6684c7280f9
   Removing intermediate container dc5557ae0583

   Successfully built f6684c7280f9
   Successfully tagged python:3.6
   (ansible-dev) SEA-ML-RUPP1:f5-ansible trupp$

Building will take a minute or two the first time that you do it. After your
initial build, you will no longer need to re-build the container unless we
specifically change the `Dockerfile` or `docker-compose.yaml` file.

.. note::

   I am deliberately using the `--no-cache` argument. This will cause the
   build to take slightly longer because it will not be re-using existing Docker
   layers. The upside, is that you do not need to be concerned with any old artifacts
   from former layers sticking around to cause problems with the build.

Finally, to make use of the new container, you can use the `run` argument to
`docker-compose`, instead of the `build` argument.

* `docker-compose -f devtools/docker-compose.yaml run py3.6.2`

For example,

.. code-block:: bash

   (ansible-dev) SEA-ML-RUPP1:f5-ansible trupp$ docker-compose -f devtools/docker-compose.yaml run py3.6.2
   docker-compose -f devtools/docker-compose.yaml run py3.6.2
   root@cd71daf91439:/here#

You will immediately be dropped into the container environment. From within this
container, you can run all the Ansible/py.test/etc commands that you need to do
development of the `f5-ansible` source code.

Also, it should be noted that you can continue to use external development tools
(like IDEs) and all the changes you make in them will be immediately reflected
in your container environment. This is made possible by a bound volume in your
container that references the `f5-ansible` source tree.

.. note::

   Local development usually happens with local F5 product running in Virtualbox
   VMs. The tools for doing this are not packaged in this container, nor are the
   Vagrantfiles for bringing up those devices. If you are external to F5, we
   provide means to make your own at the following repositories

   * https://github.com/f5devcentral/f5-packer-templates
   * https://github.com/f5devcentral/f5-vagrant-files

   Internal F5 engineers can contact the maintainers of this code-base for
   pointers on internal resources that are available.

Local Ansible source copy
-------------------------

It is required that you have a locally available source copy of the Ansible upstream
codebase. To do this, you must do the following

1. In Github, create a fork of the ansible codebase. This codebase can be found
   here https://github.com/ansible/ansible. The `Fork` button in the top right of
   the screen can be used to fork it. Please fork it to your __personal__ Github
   account

2. Clone your fork to the `local/` directory in this (f5-ansible) source tree. This
   can be done like so. `git clone git@github.com:USERNAME/ansible.git local/ansible`.
   Replace `USERNAME` with your Github username.

3. Add a `git` remote pointing to the "upstream" ansible source tree. This can be done
   from __within__ the `local/ansible/` directory. From there, issue this command,
   `git remote add upstream https://github.com/ansible/ansible`

With this setup in place, you now have the ability to do the following

- Copy f5-ansible source code "upstream" so that you can merge it into Ansible
- Re-create the integration test playbook that Ansible uses for `bigip_*` modules.
- Run all upstream PR tests that you need to run when upstreaming a new module to
  Ansible core.

We will add more things that you "can do" as they become appropriate.

Merging from other contributors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

At times it may be necessary to track other contributors source trees and test
their fixes.

The times that this is particularly import are,

* When the contributor has changed something in module_utils/ related to F5
  (for example f5_utils.py or in f5networks/).
* When the contributor has changed something in a plugin that is related to F5
  (for example an action or terminal plugin).

The reason that the procedure below is important is because it allows you to test
their changes without needing to care about exposing any internal services (such
as testing harnesses) to the outside world. Since that is strictly forbidden, it's
easier to just do the following.

* With the above local checkout of the Ansible source code in place, start by
  changing into that source code directory and adding a git `remote` for the
  repo that you want to test stuff from.

  .. code-block:: bash

     cd local/ansible
     git remote add CONTRIBUTOR https://github.com/CONTRIBUTOR/ansible.git`

* Next, fetch the content of their repository so that you can use it locally

  .. code-block:: bash

     git fetch CONTRIBUTOR

* Next, ask the contributor which branch they have been doing their development
  on. Suppose it was called `feature.foo-bar-baz`. With this information in mind,
  you would next checkout the given branch and supply the `--track` argument to
  git. This will create a local copy of the branch just for you, and will
  additionally configure `git` so that a `git pull` will pull directly from the
  CONTRIBUTOR's repo and specific branch you are using.

  .. code-block:: bash

     git checkout --track CONTRIBUTOR/feature.foo-bar-baz

* You are have the CONTRIBUTOR source at the ready. It is recommended that you
  install it in a separate `virtualenv`. We can make use of the `mkvirtualenv`
  command for this. Note that I am referencing the `requirements.test.txt` file
  from the `f5-ansible` repository.

  .. code-block:: bash

     mkvirtualenv ansible-CONTRIBUTOR
     pip install -r ../../requirements.test.txt

* With your virtualenv created, install the CONTRIBUTORS branch that you checked
  out earlier. Replace F5_ANSIBLE_PATH with the local path to your f5-ansible
  fork.

  .. code-block:: bash

     pip install file:///F5_ANSIBLE_PATH/local/ansible

* You are now fully ready to test anything that the CONTRIBUTOR wants you to
  test.

Questions
=========

Below are a variety of development environment related questions that I've been
asked and answers to each

* What is the smallest incarnation of an F5 that I can use in my lab to
  test playbooks?

I use vagrant boxes for this if I'm doing local testing. For vagrant boxes you
need to build your own, however we provide packerfiles to do that

https://github.com/f5devcentral/f5-packer-templates

and the associated vagrant files

https://github.com/f5devcentral/f5-vagrant-files

Otherwise, I use VE's on OpenStack. The base VE image should be sufficient to
run on OpenStack. I use the OVA's that we distribute because that's what works
with our OpenStack distro.

* Is there a way to get one of those and/or licensing for virtual devices?

You can get any pre-built images from downloads.f5.com (free registration) but
you will indeed need a license to make much use of it. Licenses can be acquired
through sales or, in special cases, through a business partnership with F5.
