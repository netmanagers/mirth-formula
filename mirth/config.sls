# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "mirth/map.jinja" import mirth with context %}

include:
  - mirth.install

mirth_config:
  file.managed:
    - name: {{ mirth.config.file }}
    - source: {{ mirth.config.template }}
    - mode: '644'
    - user: root
    - group: root
    - template: jinja
    - defaults:
      mirth: {{ mirth }}
    - require:
      - pkg: mirth_pkg
    - require_in:
      - service: mirth_service
    - watch_in:
      - service: mirth_service


