codetest
========

You can use make to run the unit tests, the acceptance test and install a binary. I recommend doing this inside of a sandbox. And you will also need a custom version of the HUnit-Diff package. You can get it at: git@github.com:mattraibert/HUnit-Diff.git

More precisely, run:

```
cd /path/to/codetest
mkdir deps
cd deps
git clone  git@github.com:mattraibert/HUnit-Diff.git
cd ..
cabal sandbox init
cabal sandbox add-source deps/HUnit-Diff/
make
```
