# CCS CHANGELOG

## 2010-01-23

> Mr. Scott, an alien object of unbelievable destructive power is less than two
> days away from this planet. The only starship in interception range is the
> Enterprise. Ready or not, she launches in twelve hours.
>
> &mdash; <cite>Captain James T. Kirk, Star Trek: The Motion Picture</cite>

## 2012-05-15

> Or the one. I never took the Kobayashi Maru test until now. What do you think
> of my solution?
>
> &mdash; <cite>Captain Spock, Star Trek II: The Wrath of Khan</cite>

## 2018-07-13

> **Spock**: My father says that you have been my friend. You came back for me.
>
> **Kirk**: You would have done the same for me.
>
> **Spock**: Why would you do this?
>
> &mdash; <cite>Star Trek III: The Search for Spock</cite>

- Install Ruby 1.9.2-p330
  Not sure what version was actually as `1.9.2-patched` via the outdated
  `.rvmrc` configuration file. Switch to use `.ruby-version` file and the last
  patchlevel for 1.9.2.

  Added `.ruby-gemset` configuration via `.ruby-gemset` file.

  Remove the `.rvmrc` as they are an obsolete configuration format.

- Install Ruby 1.9.3-p551
  Actually, even the last version of 1.9.2 won't compile for me and I don't want
  to fight that fight so trying last patchlevel for 1.9.3

* Install gems
  - Oh, there are warnings and gems that no longer exist.
  - YAML safe loading isn't available in this version of `psych`.
  - `git://...` urls are insecure.
  - `heroku` version used doesn't even exist.
