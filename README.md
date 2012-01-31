== Welcome to Code Camp Server

Code Camp Server is a site that we're using for Chicago Code Camp.

Much like the Chicago Code Camp that CCS was created to support,
CCS is a free, open-source application licensed under the GPL. So,
if you'd like to help make CCS better or find a problem, then please
help make it even better by contributing patches or even just submitting
defects in our Github issue tracker.

CCS is written in Rails 3 on Ruby 1.9.3. It's intended to be easily
deployed to Heroku for little or no cost.

== Chicago Code Camp

Chicago Code Camp a free, one day conf. on a Saturday in May. For devs of all
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

  Step Two. RVM

    Follow zee instructions: http://rvm.beginrescueend.com/

    rvm install 1.9.3@ccs --create --install

  Step Three. Run it.

    cp config/database.yml.postgres config/database.yml

    bundle install

    bundle exec rake db:create:all db:migrate db:seed

    bundle exec rails server

  Step Four. Github

    Fork http://github.com/chicagocodecamp/ccs

    Go nuts.

    Pull request.

== License

Copyright (C) 2011-2012  Michael D. Hall (just3ws)

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
