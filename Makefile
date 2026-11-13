.PHONY: bump link thumbnail release

# make bump VERSION=0.1.3
bump:
	$(if $(VERSION),,$(error usage: make bump VERSION=<new-version>))
	utpm prj bump $(VERSION) -i README.md template/main.typ
	$(MAKE) thumbnail

# Makes the working copy importable as @preview/h-brs-thesis-unofficial:<version>.
link:
	utpm prj link preview --no-copy --force

# Renders the template's title page in the size of the current thumbnail (1191x1684 px).
thumbnail: link
	typst compile template/main.typ thumbnail.png --pages 1 --ppi 144

# make release DESCRIPTION="What changed"
release:
	$(if $(DESCRIPTION),,$(error usage: make release DESCRIPTION="<what changed>"))
	scripts/release "$(DESCRIPTION)"
