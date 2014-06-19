#
# Author:: Shireesh Jayashetty <shireesh@elitmus.com>
# Cookbook Name:: opencv
# Recipe:: source
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

include_recipe "build-essential"
if platform?("ubuntu")
  include_recipe "apt"
end

package "cmake"
package "unzip"

version = node['opencv']['version']
installed_version = version.split(/(^\d+\.\d+\.\d+)/)[1] || version.split(/(^\d+\.\d+)/)[1]
install_path = "#{node['opencv']['prefix_dir']}/lib/libopencv_core.so.#{installed_version}"

# packages = value_for_platform_family(
#              "rhel" => %w{},
#              "default" => %w{libgtk2.0 libgtk2.0-dev pkgconfig python-dev python-numpy libavcodec-dev libavformat-dev libswscale-dev libjpeg-dev libpng-dev}
#            )
# #
# packages.each do |dev_pkg|
#   package dev_pkg
# end

remote_file "#{Chef::Config[:file_cache_path]}/opencv-#{version}.tar.gz" do
  source node['opencv']['url']
  # checksum node['opencv']['checksum']
  mode "0644"
  not_if { ::File.exists?(install_path) }
end

bash "build-and-install-opencv" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
unzip opencv-#{version}.zip
(mkdir -p opencv-#{version}/release && cd opencv-#{version}/release && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=#{node['opencv']['prefix_dir']} .. )
(cd opencv-#{version}/release && make && make install)
EOF
  environment({
      "LDFLAGS" => "-L#{node['opencv']['prefix_dir']} -L/usr/lib",
      "CPPFLAGS" => "-I#{node['opencv']['prefix_dir']} -I/usr/lib",
      "CXXFLAGS" => "-I#{node['opencv']['prefix_dir']} -I/usr/lib",
      "CFLAGS" => "-I#{node['opencv']['prefix_dir']} -I/usr/lib"
  }) if platform?("ubuntu") && node['platform_version'].to_f >= 12.04
  not_if { ::File.exists?(install_path) }
end
