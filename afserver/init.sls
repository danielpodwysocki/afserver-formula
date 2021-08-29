Install dependencies:
  pkg.installed:
    - pkgs:
      - libpython3.7
      - libpq5

#download the CGRU packages
/tmp/cgru.tar.xz:
  file.managed:
    - source: https://kumisystems.dl.sourceforge.net/project/cgru/3.2.1/cgru.3.2.1.debian10_amd64.tar.gz
    - mode: 0700
    - user: root
    - group: root
    - skip_verify: True #this is only for the hash of the file, the SSL cert should still be checked

/tmp/cgru:
  archive.extracted:
    - source: /tmp/cgru.tar.xz
    - enforce_toplevel: False

Install CGRU packages:
  pkg.installed:
    - sources:
      - cgru-common: /tmp/cgru/cgru-common.3.2.0_debian10_amd64.deb
      - afanasy-common: /tmp/cgru/afanasy-common.3.2.0_debian10_amd64.deb
      - afanasy-server: /tmp/cgru/afanasy-server.3.2.0_debian10_amd64.deb

afserver:
  service.running:
    - enable: True
