---
title: Client Application Patterns
layout: default
---

All Radium applications are built on top of our HTTP API. This
architecture creates common problems that are solved by applying a set
of patterns. Apply these patterns when writing applications.

## Use a Local Data Store

Loading data over and over again is an anti-pattern. Instead use the API
to populate a local persisted data store. Query the data store when your
application starts. If the data store does not have any records, it will
query the API and load records. These records are now persisted in the
local store. When the application starts for the second time, querying
the store will return the cached records.

## Use Smart Data Loading

Applications should load additional data into their local store while
not in use. Applications should be smart enough to know what the user's
will do next. Say you have a parent and child association. One view is
only about the parent. The next screen or view is about the child. The
application should load the parent and child at the same time. This way
when the use quickly moves to the child view the data is ready to local
to prepare the view. Here's another example. You're retrieving a
collection of parents. Retrieve the collection of children in the same
or separate request.
