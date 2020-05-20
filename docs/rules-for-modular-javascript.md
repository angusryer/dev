# Rules For Modular JavaScript

- each module is self contained
    - everything to do with the module is inside
    - no global variables
    - if a module manages more than one thing it should be split up
- separation of concerns
- DRY code: don't repeat yourself
- efficient DOM usage
    - very few $(selections)
- no memory leaks
    - all events can be unbound
