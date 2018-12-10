# Copyright:: Copyright (c) 2015.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "keycloak-server"
default_version "4.7.0.Final"
skip_transitive_dependency_licensing true

dependency "wildfly"

version "4.7.0.Final" do
  source md5: "588035466fcd65d8593d4a57d73ff796"
end

version "4.6.0.Final" do
  source md5: "5e12374673b2b61c7ae96691bae2c0cc"
end

version "4.5.0.Final" do
  source md5: "d6ab41cc8a147ef9e2ceb75e613df854"
end

version "3.4.2.Final" do
  source md5: "3878e44a310cb90782e330a445d45907"
end

version "3.4.1.Final" do
  source md5: "e3da4e72f590d77ef8cfeb18a1310751"
end

version "3.4.0.Final" do
  source md5: "e0fb96898f33a7d4cbf7eddec1a5936b"
end

version "3.3.0.Final" do
  source md5: "a4c362c960265f11b032d98d78606479"
end

version "3.2.1.Final" do
  source md5: "6accd47f4d8fc141833f066e9de83215"
end

version "2.5.5.Final" do
  source md5: "e580232fb2a1c7c9d4c89b6fef6a029d"
end

version "2.4.0.Final" do
  source md5: "12d2c1eedd7cdd60c7edb0e38bdc4f5a"
end

version "2.3.0.Final" do
  source md5: "32e46a61d38f20b6d72d493336ffb34e"
end

source url: "https://downloads.jboss.org/keycloak/#{version}/keycloak-overlay-#{version}.tar.gz"

build do
  command "mkdir -p #{install_dir}/embedded/apps/keycloak-server/keycloak-overlay-#{version}"
  sync "#{project_dir}/", "#{install_dir}/embedded/apps/keycloak-server/keycloak-overlay-#{version}"

  # Strip KC version from packages.
  link "#{install_dir}/embedded/apps/keycloak-server/keycloak-overlay-#{version}", "#{install_dir}/embedded/apps/keycloak-server/keycloak-overlay"
end
