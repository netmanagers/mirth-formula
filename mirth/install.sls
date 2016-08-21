# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "mirth/map.jinja" import mirth with context %}

{% set package_local_copy = '/tmp/' ~ mirth.pkg.name ~ '-' ~ mirth.pkg.version ~ '-linux.rpm' %}

# Install java if required
{% if mirth.java.install %}
mirth_java:
  pkg.installed:
    - name: {{ mirth.java.pkg }}
    - require_in:
        - pkg: mirth_pkg
{% endif %}

# Download the mirth package and keep it locally, as using
# pkg: sources
# tries to download it every time BEFORE checking if the package is installed.
# In the future, if this is fixed, using that format will make things easier

mirth_downloaded_pkg:
  file.managed:
    - name: {{ package_local_copy }}
    - source: {{ mirth.pkg.source }}
    - source_hash: {{ mirth.pkg.source_hash }}

# Need to check the installed version as the package's information seems to be poorly
# written, and this confuses salt checks
get_currently_installed_version:
  cmd.run:
    - name: 'rpm -qa|grep {{ mirth.pkg.name }} |grep {{ mirth.pkg.version }}'

mirth_pkg:
  pkg.installed:
    # The mirth package reports to be for the i386 arch
    #- normalize: true
    - sources:
      - {{ mirth.pkg.name }}: {{ package_local_copy }}
    - require:
      - file: mirth_downloaded_pkg
    - onfail:
      - cmd: get_currently_installed_version

{% if mirth.user.create %}
mirth_user:
  user.present:
    - name: {{ mirth.user.name }}
    - gid_from_name: {{ mirth.user.gid_from_name }}
    - createhome: {{ mirth.user.createhome }}
    - system: {{ mirth.user.system }}
{% endif %}

