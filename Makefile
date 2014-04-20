RUN=cabal exec runghc -- -isrc
BINDIR=.cabal-sandbox/bin
EXECUTABLE=$(BINDIR)/codetest
BUILDDIR=dist

.PHONY: all install clean test acceptance init deps sandbox

all: init install test acceptance

install: $(EXECUTABLE)

$(EXECUTABLE):
	cabal install -j

test:
	$(RUN) src/Test/Main.hs

acceptance:
	$(RUN) src/Test/Acceptance.hs

clean:
	rm -rf $(BUILDDIR) && rm $(EXECUTABLE)

init: deps sandbox


DEPS=deps/HUnit-Diff

deps: $(DEPS)

$(DEPS):
	git clone git@github.com:mattraibert/HUnit-Diff.git deps/HUnit-Diff

sandbox: deps cabal.sandbox.config

cabal.sandbox.config:
	cabal sandbox init
	cabal sandbox add-source $(DEPS)
