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
