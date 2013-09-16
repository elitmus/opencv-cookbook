Description
===========
 
Chef cookbook to install OpenCV from source.

The OpenCV PPA is lagging behind and is incompatible with ruby-opencv gem. Hence I wrote this cookbook so that we can install OpenCV using source. After this

      gem install ruby-opencv -v '0.0.10'

will run smoothly
 
Requirements
============
 
## Platform:
 
* Ubuntu

Tested on Ubuntu 12.04 LTS. Can be extended to other platforms but my current instest is Ubuntu.
 
## Coobooks:
 
* build-essentail
 
Attributes
==========
 
See `attributes/default.rb` for default values.
 
Recipes
=======
 
default
-------
 
Launch the "source" recipe.
 
Usage
=====
 
Include `recipe[opencv]` on systems where you want to install opencv.
Make sure you have set the correct version number for `node.default['opencv']['version']` in the attributes file.
 
License and Author
==================
 
Author:: Shireesh Jayashetty
 
Copyright:: 2013, eLitmus Evaluation Private Limited, Bangalore, India.
 
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
 
    http://www.apache.org/licenses/LICENSE-2.0
 
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.




