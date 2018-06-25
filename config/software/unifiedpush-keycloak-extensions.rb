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

name "unifiedpush-keycloak-extensions"
default_version "master"
skip_transitive_dependency_licensing true

source git: "https://github.com/C-B4/unifiedpush-keycloak-extensions.git"

relative_path "unifiedpush-keycloak-extensions"
build_dir = "#{project_dir}"
keycloak_version = "3.4.2.Final"
keycloak_services_jar_name="keycloak-services" 
keycloak_services_jar= "#{install_dir}/embedded/apps/keycloak-server/keycloak-overlay/modules/system/layers/keycloak/org/keycloak/#{keycloak_services_jar_name}/main/#{keycloak_services_jar_name}-#{keycloak_version}.jar"

build do
  command "cd #{keycloak_services_jar_name}; mvn clean install -DskipTests"

  # Add aerobase service implementaion to keycloak-services
  command "cd #{build_dir}/#{keycloak_services_jar_name}/target/classes/; jar -uf #{keycloak_services_jar} org/keycloak/services/validation/Validation.class"
  command "cd #{build_dir}/#{keycloak_services_jar_name}/target/classes/; jar -uf #{keycloak_services_jar} org/keycloak/authentication/forms/RegistrationProfile.class"
end
