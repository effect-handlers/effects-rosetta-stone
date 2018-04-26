set -uex

#OCaml
sh .travis-ocaml.sh
export OPAMYES=1
eval $(opam config env)
opam install -y ocamlfind ocamlbuild

#Eff
opam switch 4.02.3
eval $(opam config env)
opam pin add -k git eff https://github.com/matijapretnar/eff.git
opam install -y eff

# Links (pinned to a particular development commit)
opam switch 4.04.2
eval $(opam config env)
opam pin add -k git links https://github.com/links-lang/links.git#4d35428fff799511a82ca45a7e8a6fc0c76e8c65
opam install -y links
