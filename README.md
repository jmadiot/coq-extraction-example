This repository shows a working dune setup for Rocq/Coq extraction that may be
useful in particular for those of us who are not familiar with dune.

The directory `math` contains the definition of a function `phi : nat -> nat` in
file `a.v`. It is package as a coq library, which is in dune terms, is called a
`coq.theory`. The corresponding dune file names it `mytheory`.

The `mono` directory shows how to use (monolithic) extraction : the rocq file
`b.v` requires the module `a.v` from `mytheory` and extracts `phi` into a single
file `c.ml`, recursively including all dependencies. The file `d.ml` uses the
extracted `C` module to print some values of `phi`. Because `d` uses `C`, dune
has to be told that `b` will produce `c` with `extracted_modules c`. (The file
`c.ml` stays in `_build` and is not promoted to the source tree.)

The `sep` directory does the same thing but with `Separate Extraction`: in this
case the file `e.v` does not specify a filename and Rocq produces the modules
used by `phi` as independent files. We have to tell dune about the ones that
will be useful, here: `extracted_modules Datatypes Nat a`. Then `f.ml` imports
the modules `A` (to talk about `phi`) and `Datatypes` (to talk about `O` and
`S`).

It is possible to run the executables with `dune exec mono/d.exe` or `dune exec
sep/f.exe`.
