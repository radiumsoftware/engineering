## Separate Data Storage and Loading

Applications must query the API to retrieve or agument data.
Applications must realize there is a separations of concerns and follow
the SRP. One class is used to store the data and one class is used to
load the data. There is a common interface between the two. Separating
these two promotes good testing practices since each class can be tested
in isolation. In practice this means you can unit test your loader and
store separate. This also means you can stub out the adapter when
needed. Integration tests only query the store. You can implement a
fixture adapter or an in-memory adapter for those. The important thing
is that data storage and loading are separate.
