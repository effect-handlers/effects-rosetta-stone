set -uex

#OCaml
sh .travis-ocaml.sh
export OPAMYES=1
eval $(opam config env)
opam install -y ocamlfind ocamlbuild

#Eff
opam switch 4.02.3
eval $(opam config env)
opam install -y eff
