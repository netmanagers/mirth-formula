================
mirth-formula
================

A saltstack formula to install and configure mirthconnect in Linux
Currently only supports installing on CentOS 7 and probably other RedHat family
members.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``mirth``
------------

Installs the mirth package, and starts the associated mirth service.

``mirth.install``
------------

Installs the mirth package

``mirth.service``
------------

Installs a mirth systemd file and starts the associated mirth service.
