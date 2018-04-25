# Effects and handlers Rosetta stone

A collection of examples demonstrating programming with effects and handlers in
various programming languages.

## How to contribute

### General guidelines

1. Each example instance should be self-contained.

2. Each example should demonstrate *one* aspect of effectful programming.
   This does not mean it has to be simple.

3. In the naming of making comparisons possible, different implementations of a
   single example should do *the same thing* as far as that is possible. For
   instance, if there are *two* ways to implement an effect, e.g., state using
   the usual monad and state using parametrized effects, then there should be
   *two* examples which are identical, except for the implementation. If you
   feel that the implementation is unnatural, please comment on this, but still
   do it.

4. Do *not* print things out in examples that do not call for printing. Instead,
   just compute whatever needs to be computed and store the results in top-level
   values. Many languages will show the values anyhow, and that is as good as
   printing.

5. All folder names are in lower case, with words separated by dashes, e.g.,
   `cooperative-threads`, `multicore-ocaml`, `algol-68`.

### Repository structure

The repository contains examples in the `examples` folder, with a subfolder
`examples/example-x` for each *"Example X"*, and further containing:

* `README.md` contains a general description of the example
* `language-y` contains the example implemented in *"Language Y"*, which further
   contains:

   * an optional `README.md` contains further comments on the language
     implementation of the example,
   * a `Makefile` whose target `all` runs all the source code
   * self-contained source code, following the established standards for the
     programming language

### How to contribute a new programming language

To add a new programming language *My Language*, follow these steps:

1. Pick a lower-case name for the folders which contain examples written in My
   Language, e.g., `my-language`.
2. Describe the language in the section *Languages* below. Use `my-language` as
   the section name. Please provide links to the language home page and
   installation instructions.
3. Implement at least one [example
   instance](#how-to-contribute-an-example-instance) in your language.

### How to contribute a new example

To add a completely new example, follow these steps:

1. Pick a lower case folder name for the example, e.g., `example-x`.
2. Create a lower-case folder `examples/example-x` that will contain the example
   and put in it `README.md` with a general description of the example. Please
   follow the format of existing example descriptions.
3. Implement at least one [example
   instance](#how-to-contribute-an-example-instance) so that it is clear what
   needs to be implemented.

### How to contribute an example instance

To implement an example instance of `example-x` in `language-y`, create
`examples/example-x/language-y` and populate it, following the [repository
structure](#repository-structure) guidelines.

You may show several variants of the example. We recommend that you put them in
separate files, comment on them on the `README.md` file, and clearly mark one of
the examples as the *main* one. The main example is the one that people should
look at first.

### How to contribute an example non-instance

If something cannot be naturally implemented in your language, we want to know
about it! Create the folder `examples/example-x/language-y` and put in it
`README.md` which explains what the problem is.

You may add a *partial*, *simplified*, or *modified* implementation, in which
case you should explicitly describe the changes you made in `README.md`.

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

To run Eff code contained in a file `example.eff`, run from the command line:

```bash
eff example.eff
```

You can also run `make` in the example directory and it will run all examples for you.


### `multicore-ocaml`

[Multicore OCaml](https://github.com/ocamllabs/ocaml-multicore) can be installed
through [OPAM](https://opam.ocaml.org):

```bash
$ opam remote add multicore https://github.com/ocamllabs/multicore-opam.git
$ opam switch 4.06.1+multicore
```

### `frank`

Install Frank from the [Frank GitHub repository](https://github.com/frank-lang/frank). To run
a Frank program contained in a file `example.fk`, run from the command line:

```bash
frank example.fk
```

## About the repository

The participants of Dagstuhl seminar [Algebraic effect handlers go
mainstream](https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18172) have
initiated this repository of examples that show how to program with algebraic
effects and handlers in various languages.
