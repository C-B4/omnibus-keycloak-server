#
# Copyright:: Copyright (c) 2013, 2014
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "#{Omnibus::Config.project_root}/lib/unifiedpush/build_iteration"

name "keycloak-server"
maintainer "Yaniv Marom-Nachumi"
homepage "https://github.com/C-B4/omnibus-keycloak-server"

# Defaults to C:/unifiedpush on Windows
# and /opt/unifiedpush on all other platforms
install_dir "#{default_root}/unifiedpush"

build_version   Omnibus::BuildVersion.new.semver
build_iteration Unifiedpush::BuildIteration.new.build_iteration

# Creates required build directories
dependency "preparation"

# keycloak-server is the most expensive runtime build, therefore keep it first in order.
dependency "keycloak-server"

exclude "**/.git"
exclude "**/bundler/git"

# Our package scripts are generated from .erb files,
# so we will grab them from an excluded folder
package_scripts_path "#{install_dir}/.package_util/package-scripts"
exclude '.package_util'
exclude 'LICENSE'
exclude 'version-manifest.*'

package_user 'root'
package_group 'root'
