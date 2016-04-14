#
# Author:: Shireesh Jayashetty (<shireesh@elitmus.com>)
# Cookbook Name:: opencv
# Attribute:: default
#
# Copyright 2013, eLitmus.com
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

node.default['opencv']['version'] = '2.4.12'
node.default['opencv']['install_method'] = 'source'

if opencv['install_method'] == 'package'
  case platform
  when "smartos"
    node.default['opencv']['prefix_dir'] = '/opt/local'
  else
    node.default['opencv']['prefix_dir'] = '/usr'
  end
else
  node.default['opencv']['prefix_dir'] = '/usr/local'
end

node.default['opencv']['binary'] = "#{opencv['prefix_dir']}/bin/opencv"

# node.default['opencv']['url'] = "http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/#{opencv['version']}/opencv-#{opencv['version']}.tar.gz/download"
node.default['opencv']['url'] = "https://github.com/Itseez/opencv/archive/#{opencv['version']}.tar.gz"
# node.default['opencv']['checksum'] = '3b477554864e616a041ee4d7cef9849751770bc7c39adaf78a94ea145c488059'
