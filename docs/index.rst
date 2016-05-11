F5 Ansible Docs
===============

This project implements a set of Ansible modules for the F5 Networks® BIG-IP®
Users of these modules can create, edit, update, and delete configuration
objects on a BIG-IP®. For more information on the basic principals that the
modules use, see the :doc:`userguide/index`.

The code is open source, and `available on github`_. Additionally, some modules
have been promoted to the `Ansible core product`_ and `Ansible extras`_.

.. _available on github: https://github.com/F5Networks/f5-ansible
.. _Ansible core product: https://github.com/ansible/ansible-modules-core
.. _Ansible extras https://github.com/ansible/ansible-modules-extras

The main documentation for the modules is organized into a couple sections:

* :ref:`user-docs`
* :ref:`module-docs`
* :ref:`dev-docs`

.. _user-docs:

.. toctree::
   :maxdepth: 2
   :caption: User Documentation

   getting_started
   versions
   support
   guides/index


.. _module-docs:

.. toctree::
   :maxdepth: 2
   :glob:
   :caption: Module Documentation

   general
   modules/*


.. _dev-docs:

.. toctree::
   :maxdepth: 2
   :caption: Developer Documentation

   install
   contribute
   tests
   architecture
   development/standards
   development/buildenvironments
   upstreaming