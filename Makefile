.PHONY: bump link release

# make bump VERSION=0.1.3
bump:
	$(if $(VERSION),,$(error usage: make bump VERSION=<new-version>))
	utpm prj bump $(VERSION) -i README.md template/main.typ

# Makes the working copy importable as @preview/h-brs-thesis-unofficial:<version>.
link:
	utpm prj link preview --no-copy --force

# make release DESCRIPTION="What changed"
release:
	$(if $(DESCRIPTION),,$(error usage: make release DESCRIPTION="<what changed>"))
	scripts/release "$(DESCRIPTION)"
