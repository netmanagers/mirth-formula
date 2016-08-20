# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "mirth/map.jinja" import mirth with context %}

include:
  - mirth.install

mirth_service_file:
  file.managed:
    - name: {{ mirth.service.file }}
    - source:
      - {{ mirth.service.source }}
    - user: root
    - group: root
    - mode: '644'

mirth_service:
  service.running:
    - name: {{ mirth.service.name }}
    - enable: true
    - require:
      - pkg: mirth_pkg
      - file: mirth_service_file

