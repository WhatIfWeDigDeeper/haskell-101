# haskell-edx

force stack install

```bash
curl -sSL https://get.haskellstack.org/ | sh -s - -f

stack upgrade

stack new proj-name
stack update

# ensures latest GHC Glaskow Haskell Compiler
stack setup

stack init
stack build
stack exec haskell-edx-exe
```

## Cabal package manager

```bash
cabal update

cabal install text
```

## package.yaml

```
dependencies:
  - base >= 4.7 && < 5
  - text  # add dependencies here?
```

## Testing

```bash
stack test
```
