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

## 2025-02-06

> **McCoy:** *“My God, man… drilling holes in his head isn't the answer. The kid's memory is gone.”*
>
> **Kirk:** *“No, Bones. His memory is there. We just have to coax it back.”*
>
> &mdash; <cite>*Star Trek IV: The Voyage Home*</cite>

* **Resurrect the 2012 CCS application from deep storage**
  After more than a decade offline, CCS now boots again inside a fully containerized Ruby 1.9.3 + Rails 3 environment.

* **Dockerize the entire runtime stack**

  * Added `Dockerfile` capable of building Ruby 1.9.3-p551 on Ubuntu 14.04
  * Added `docker-compose.yml` orchestrating Rails, Postgres 9.6, and Memcached
  * Added `entrypoint.sh` for deterministic boot
  * Added `Makefile` for migrations, resets, seeds, and developer workflow

* **Modernize environment configuration**

  * Replace ancient `.rvmrc` setup with `.tool-versions`
  * Introduce explicit bundler path volume for reproducible installs

* **Repair broken migrations**

  * Update `MoveAdminNotesToComments` to handle missing historical index state
  * Normalize schema loading for legacy structure

* **Successfully boot the server for the first time since 2012**
  The app now launches cleanly via Docker, confirming data model, routes, and legacy dependencies operate in an isolated reproducible environment.

