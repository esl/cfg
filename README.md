cfg
=====

A (distributed) configuration management application

Build
-----

    $ rebar3 compile
    
Cfg
---

Cfg is used as a part of other application. It provides the management of
application configuration variables in a distributed manner. It also defines the
structure an application shall have its module definitions in case application
analysis is to be performed whe upgrade check is needed.

Intended behavior
-----------------
When an application is started in an Erlang cluster it shall start the cfg
application first. Gapp kind of application has this by default.

When gapp first connects to a configured erlang cluster it starts the cfg
application. In cfg_app:init, cfg shall find another remote cfg app in the
cluster, ask it for updated configuration values and save the new config values
in a dets table. If there is no other cfg app in the cluster, the dets table
shall be used to reload the configuration values. This is needed in case of a
total cluster failure when no node was up, so the first node shall load the
production configuration values from the saved dets table.
