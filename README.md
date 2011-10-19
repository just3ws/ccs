== Welcome to Code Camp Server

Code Camp Server is a site that we're using for Chicago Code Camp.

Much like the Chicago Code Camp that CCS was created to support,
CCS is a free, open-source application licensed under the GPL. So,
if you'd like to help make CCS better or find a problem, then please
help make it even better by contributing patches or even just submitting
defects in our Github issue tracker.

CCS is written in Rails 3 on Ruby 1.9.2 (ruby-1.9.2-p290-patched). It's intended to be easily 
deployed to Heroku for little or no cost. 

== Chicago Code Camp

Chicago Code Camp a free, 1 day conf. on Sat. May 14th. For devs of all 
skill levels & interests, w/multiple sessions running side-by-side.

== Getting Started 

- OS X

  # there are many paths, this one is mine (MDH)
  # read the output to find out if each command has extra steps.

  Step One: Homebrew

    Follow zee instructions: https://github.com/mxcl/homebrew
 
    brew install libiconv; brew install libxml2;

    brew install git && brew info git;

    brew install sqlite && brew info sqlite;

    # OPTIONAL STEPS

    brew install redis && brew info redis;

    brew install postgresql && brew info postgresql;

    brew install memcached && brew info memcached;

  Step Twone: RubyCocoa (optional)

    brew install wget

    cd ~/Downloads
 
    wget http://downloads.sourceforge.net/project/rubycocoa/RubyCocoa/1.0.0/RubyCocoa-1.0.0.tar.gz  
   
    tar -xvzf RubyCocoa-1.0.0.tar.gz
    cd RubyCocoa-1.0.0

    ruby install.rb config --build-universal=yes 
    ruby install.rb setup 
    sudo ruby install.rb install

  Step Two. RVM

    Follow zee instructions: http://rvm.beginrescueend.com/

    rvm pkg install readline;
    rvm pkg install openssl;

    rvm install ree-1.8.7-2010.02 \
      --reconfigure -C --enable-shared=yes  \
      --with-readline-dir=$rvm_path/usr \
      --with-openssl-dir=$rvm_path/usr;
    
  3. Github

    Fork http://github.com/chicagocodecamp/ccs

    Go nuts.

    Pull request.

== License

Copyright (C) 2011  Michael D. Hall (just3ws)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
