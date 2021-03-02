# website-styles

Styling for the GlamSci website

## Sass CSS generation

Uses: https://sass-lang.com/guide
Quick global install: `npm install -g dart-sass`

To generate `custom.css` run:
`dart-sass --embed-sources e-voice.scss:custom.css`

To see against the _live_ site, use Chrome dev tools sources override against this
directory and run:
`dart-sass --embed-sources e-voice.scss:.\output\glamsci-website-styles.s3.eu-west-2.amazonaws.com\custom.css` (version may change)

## Deployment

On merge or push to main, a GitHub Action deploys the files to S3.

### Defaults

Variables are used for defining common things like colour easily through-out, for
example:

``` css
$primary_pink: #f20762;
$secondary_pink: #8b0136;
```
