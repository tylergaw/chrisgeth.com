# Third-party JavaScript goes here
Ideally, 3rd party scripts are installed with `npm`. If something isn’t available
on npm, place it here.

You’ll either need to require it with the relative path like:

```javascript
require('./vendor/foo');
```

If it's not a CommonJS module you’ll need to Browserify-Shim it in package.json
`browserify-shim` is installed as a dev dependency.
```javascript
{
  "browser": {
    "foo": "./src/js/vendor/foo.js"
  },
  "browserify": {
    "transform": "browserify-shim"
  },
  "browserify-shim": {
    "foo": "FOO"
  }
}
```
