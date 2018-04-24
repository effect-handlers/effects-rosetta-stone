# Effects and handlers Rosetta stone

A collection of examples demonstrating programming with effects and handlers in
various programming languages.

## How to contribute

### General guidelines

1. Each example should be self-contained.
2. Each example should demonstrate one aspect of effectful programming.
3. All folder names are in lower case, with words separated by dashes, e.g.,
   `cooperative-threads`, `multicore-ocaml`, `algol-68`.

### Repository structure

The repository contains one folder `example-x` for each example, which is
organized as follows:

* `example-x/README.md` contains a general description of the example
* `example-x/language-y` contains the example implemented in `language-y`, where
   an optional `example-x/language-y/README.md` contains further remarks about
   the language implementation of the example, if any.

### How to contribute a new programming language

To add a new programming language *My Language*, follow these steps:

1. Pick a lower-case name for the folders which contain examples written in My
   Language, e.g., `my-language`.
2. Describe the language in the section *Languages* below. Use `my-language` as
   the section name. Please provide links to the language home page and
   installation instructions.
3. Implement at least one example in your language.

### How to contribute a new example

To add a completely new example, follow these steps:

1. Create a lower-case folder `example-x` that will contain the example.
2. Create `example-x/README.md` and write a general description of the problem.
   Please follow the format of existing example descriptions.
3. Implement at least one example so that it is clear what needs to be
   implemented.

### How to contribute a new example instance

To contribute an implementation of `example-x` in `language-y`, create the
folder `example-x/language-y` and put the examples in it. If you have
language-specific comments about the example, put them in
`example-x/language-y/README.md`.

You may show several variants of the example. We recommend that you put them in
separate files, comment on them on the `README.md` file, and clearly mark one of
the examples as the *main* one. The main example is the one that people should
look at first.

### What if an example cannot be done in my language?

We want to know about it! You should still include your language under the
example, but without source code, or maybe with a partial solution. In the
`README.md` you can explain what prevents the language from implementing the
example.

### May I improve other people's code?

Yes, we strongly encourage sharing and cooperation.

## Languages

An alphabetically ordered list of the languages used in the examples. The
section name must match the folder name used for that language.

### `eff`

The [Eff](http://www.eff-lang.org/) programming language can be installed
[through OPAM](https://github.com/matijapretnar/eff/#installing-with-opam),
compiled from [source code](https://github.com/matijapretnar/eff/), or [run in a
browser](http://www.eff-lang.org/try/).

To run Eff code contained in a file `example.eff`, run

    eff example.eff

from the command line.

## About the repository

The participants of Dagstuhl seminar [Algebraic effect handlers go
mainstream](https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18172) have
initiated this repository of examples that show how to program with algebraic
effects and handlers in various languages.
