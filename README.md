# website-styles
Styling for the GlamSci website

## Sass CSS generation
Uses: https://sass-lang.com/guide
Quick global install: `npm install -g sass`

To generate `custom.css` run:
`sass e-voice.scss custom.css`

To edit the files and generate the output on the fly, watch can be used:
`sass -watch e-voice.scss:custom.css`

To see against the _live_ site, use the dev tools sources override against this
directory and run:
`sass -watch e-voice.scss:.\e-voice.org.uk\resources\themes\appstrap\css\custom.css%3fv=9` (version may change)

### Defaults

Variables are used for defining common things like colour easily through-out, for
example:

``` css
$primary_pink: #f20762;
$secondary_pink: #8b0136;
```
