=============
mirth-formula
=============

A saltstack formula to install and configure `mirthconnect <https://www.mirth.com/>`_ in Linux, following
`these instructions <http://www.buddhaesque.com/2015/09/installing-mirth-connect-on-centos-7/>`_.
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
---------

Installs the mirth package and starts the associated mirth service, with the package's
default configuration (by calling mirth.install and mirth.service)

``mirth.install``
-----------------

Installs the mirth package

``mirth.service``
-----------------

Installs a mirth systemd file and starts the associated mirth service.

``mirth.config``
-----------------

Manages mirth's configuration. See pillar.example for the possible parameters,
check mirth/default.yaml for default values.

