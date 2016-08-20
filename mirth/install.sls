# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "mirth/map.jinja" import mirth with context %}

# Install java if required
{% if mirth.java.install %}
mirth_java:
  pkg.installed:
    - name: {{ mirth.java.pkg }}
    - require_in:
        - pkg: mirth_pkg
{% endif %}

mirth_pkg:
  pkg.installed:
    - sources:
      - {{ mirth.pkg }}: {{ mirth.pkg_source }}

