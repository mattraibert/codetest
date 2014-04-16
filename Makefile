SANDBOXFLAGS=-no-user-package-db -package-db=.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d
RUN=runghc $(SANDBOXFLAGS) -isrc
BINDIR=.cabal-sandbox/bin
EXECUTABLE=learnyou
BUILDDIR=dist

all: test acceptance install
install:
	cabal install -j

test:
	$(RUN) src/Test.hs

acceptance:
	$(RUN) src/AcceptanceTest.hs

clean:
	rm -rf $(BUILDDIR) && rm $(BINDIR)/$(EXECUTABLE)