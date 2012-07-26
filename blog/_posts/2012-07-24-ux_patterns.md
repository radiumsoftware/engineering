---
title: User Experience Patterns
layout: default
---

This document focuses solely on the end user experience. This is the
**only** thing that truly matters. User don't care if your application
is written using the latest and greatest or if it's written in straight
up bytecode. They just need it work fast and correctly. We care about
fast. We want uberfast. User's want fast. We want to impressive users
with how fast the application is.

## Take Advantage of the Initial Boot

User's expect applications to respond to their interactions quickly. Our
aim is to meet those expectations. There are different expectations and
different points. User's understand that applications may require some
initial setup. They also understand that their data is not there yet.
This expectation changes once they've started using the application.
Take advantage of expectation when the application is loaded for the
very first time. You can take more time here to load data than you can
at other points. Your application may have a simple initial view. Load
the required data right away, then kick of requests to load in more
data. User's will be more accepting here then they will be at any other
time!

## Loading Screens are Antipattern

Loading bars and screens indicate that the application was not ready to
handle that interaction. Loading screens will have to be displayed at
some point. This is a fact. Their use should be minimized. They make the
user wait and do nothing else. Use smart data loading and other
techniques to minimize them.

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

## Use Animations to Mask Load Times

Loading records usually takes the same amount of time. Use an animation
that lasts that amount of time to mask loading. This way the user sees
the application reacting and animating instead of loading bars. This
creates a better preceived experience.

Example: User wants to navigate to a new view that requires an API
query. Use a sliding animation to slide the current view out and the new
view in while the record is loading. If an API query takes 200ms, then
make the animation last close to 200ms.

## Handle Network Failure

Applications depend on the API. The API would be up 100% of the time in
a perfect world. In a perfect world you would never lose your internet
connection. In a perfect world you would never leave the coverage zone.
We don't live in a perfect world. There is PHP and we've all lost
internet connections. The application should handle this gracefully. The
user should know that something is not working. Gracefully means:

* Display a UI telling the user there is a connection problem
* Don't exit the current interaction. If a record is being added and it
  cannot be saved allow the user to try again or wait and try again
  later. **Don't lose their stuff!**

## Handle Application Failure

Users will find ways to crash your application and blow it up. It's just
the way these things work. Appications must be robust enough to handle
this. The most important thing here is: **Don't lose their stuff!**.
There is no specific way to implement this. Applications can save input
values locally so when the application is started again the view can be
repopulated.

## Start Where the User Left Off

Save the user's current position when the applicatoin exists. Return to
this view when the user starts the application again.

## Handle the Blank State

It's common for developers to forget what happens when there is no data.
Why? Because we add data and see what things look like. Don't forget the
blank state. The blank state must accomplish two things:

1. Tell the user there is nothing to display.
2. Prompt the user for action to add something.

Example: You have no todos today! Click here to add some.

## Infinite Scrolling

Infinite scrolling is common in applications. The implemenation
generally works like this:

1. Display the initial set of items
2. When the user scrolls down, query the API to load the next page.
3. Display the new items.
4. Repeat

This works fine as an initial implementation, however the initial
implementation does not offer a satisfactory user experience. Contacting
the API and rendering new items makes the user perceive a slow down.
This is especially true for users on slow or intermitent connections
(mobile). The application should use smart loading to prepare for the
next interaction. In this case, the next interaction is to scroll down.
The application should have this data ready when the initial view is
rendered. Here's a step up from the initial implementation.

1. Load in the initial and second pages
2. When the user scroll's down request the third page
3. Display the second page
4. Repeat # now the user can immediately scroll to the third page

This implemenation makes the UX fast. This implementation can be
abstracted out to this:

1. Load the entire collection
2. Display page 1
3. When the user scrolls down, select page 2 from the local data, and
   display page 2.
4. Repeat

Each of these implementations will load more data in the local store.
This means you will not have to query the API when the user wants to use
this view again.

Here is another implemenation that should provide the best user
experience. You may have to adapt this depending on your platform.

1. Load the entire collection
2. Display the entire collection but only present the initial view
3. When the user scrolls down, show the next section
4. Repeat

This implementation assumes you have the entire collection loaded and
that it's more performant to display an existing hidden view vs generate
a new view on the fly. You will have to adapt these implementations
depending on platform limitations.

*Note for Touchscreen Devices*: Touch screen devices should provide
pull to refresh functionality. Conversely, when the user scrolls to the
top of the list trigger a refresh or load more action.
