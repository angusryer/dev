# Responsive Site Checklist

This document is intended a best practices guide to building responsive websites.

## Flexible Layouts

### Set the viewport

The viewport meta element is what turns a regular website page into a responsive page, and it’s also one of the number one reason for StackOverflow questions on why media queries are not working.

```html
<meta tag="viewport" content="width=device-width, initial-scale=1">
```

Mobile browsers render pages in a virtual window or viewport, generally at 960px, which is usually wider than the screen, and then shrink the rendered result down so it can all be seen at once. Adding one line of code resets the viewport width to be the size of the device itself (meaning this works on EVERY device today and ALL new devices built in the future) and it sets the scale to 1 (which means it’s not zoomed in or out).
