name             "sphinx"
maintainer       "Jesse R. Adams"
maintainer_email "jesse@techno-geeks.org"
license          "Apache 2.0"
description      "Installs/Configures sphinx search engine."
version          "1.0.3"

recipe           "sphinx", "Installs sphinx"
recipe           "sphinx::package", "Installs sphinx from a package"
recipe           "sphinx::source", "Installs sphinx from source"

provides         "sphinx::default"
provides         "sphinx::package"
provides         "sphinx::source"

depends          "build-essential", ">= 1.1.2"
depends          "mysql"
depends          "percona"
depends          "postgresql", ">= 1.0.0"
depends          "yum", ">= 2.0.0"
depends          "apt"

supports         "centos"
supports         "rhel"
supports         "ubuntu"
supports         "debian"
