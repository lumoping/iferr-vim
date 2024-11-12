# Generate "if err != nil {" block

Generate `if err != nil {` block for current function.

## Usage

Install and update by

```console
go install github.com/koron/iferr@latest
```

Run, it get `if err != nil {` block for the postion at 1234 bytes.

```console
$ iferr -pos 1234 < main.go
if err != nil {
 return ""
}
```

```console
$ iferr -pos 1234 < main.go
if err != nil {
 return ""
}
```

Customize your error message:

```console
$ iferr -pos 110 -message 'fmt.Errorf("failed to %w", err)' < main.go
if err != nil {
        return 0, fmt.Errorf("failed to %w", err)
}
```

## Vim plugin

```lua
return {
  "lumoping/iferr-vim",
}
```

Before:

```go
package foo

import "io"

func Foo() (io.Reader, error) { // the cursor on this line.
}
```

Run `:IfErr` then you will get:

```go
package foo

import "io"

func Foo() (io.Reader, error) {
 if err != nil {
  return nil, err
 }
} // new cursor is at here.
```
