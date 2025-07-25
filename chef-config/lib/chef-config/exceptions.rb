#
# Copyright:: Copyright (c) Chef Software Inc.
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

require_relative "windows"
require_relative "logger"

module ChefConfig

  class ConfigurationError < ArgumentError; end
  class InvalidPath < StandardError; end
  class UnparsableConfigOption < StandardError; end
  class NoCredentialsFound < StandardError; end

  class UnsupportedSecretsProvider < ConfigurationError; end
  class UnresolvedSecret < ConfigurationError; end
end
