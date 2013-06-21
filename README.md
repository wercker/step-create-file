# Create file

A step that creates a new file and writes the specified content to it.
When the file already exists, the step will fail if `overwite` option is not set
to `true`.

## Options

* `filename` - This is the path to the file. This option is required and the
  step will fail when missing. You can use `$WERCKER_ROOT` to get the root
  directory of the current pipeline context.
* `content` - The content that will be written to the file.
* `overwrite` - Set to "true" if this step should overwrite a file when it already
  exists. When this option is not set, or set to any other value the step fails
  when the file already exists.
* `hide-from-log` - Set to "true" if you do not want to log the content to the logs.

## Example

    - create-file:
        name: Create robots.txt
        filename: $WERCKER_ROOT/robots.txt
        content: |-
            # Allow everything except drafts
            User-agent: *
            Allow: /
            Disallow: /drafts/
