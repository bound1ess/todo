# Todo

## Idea

A deadly simple task manager that only knows 4 commands - `add`, `top`, `done` and `use`.
Also, it can't store more than 5 tasks at the same time. You've been warned.

## Storage

All your tasks (up to 5) will be stored in a single plaintext file `~/.todo-list`, where
`~` is your home directory (for example, `/home/john`).

First line of the file always contains container type - either `stack` or `queue`.
Tasks follow, each on its own line. One task = one line, okay?

## Containers: Stack or Queue?

When executing, all tasks will be parsed into a *container*, which can be either one mentioned.
Let's quickly review the difference between the two. Suppose we have 2 tasks:

```
todo add 'First task'
todo add 'Second task'
```

If we run `todo top` now, it'll return the *top element* of the container.
We're using a *queue* by default, so the output will be `First task` since it's in *FIFO* mode.
Now let's switch to *stack*: `todo use stack`.
The top element is now `Second task` because a stack is *LIFO* type of container.

## I AM DONE

```
todo done
```

This command will mark the top task (the top element of the container) as completed.
Essentially, it'll just get removed from the file. Next one!

#### Installation

1. Clone this repository.
2. Install all dependencies using Bundler (run `bundle --without dev`).
3. Run `build` script to build and install the gem locally.

## License information

The MIT license.
