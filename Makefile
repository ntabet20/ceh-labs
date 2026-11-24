# make lab LAB=modules/03-scanning-networks/lab-01-nmap-host-discovery
# make new MODULE=04-enumeration LAB=lab-01-smb-enum
LAB ?=
lab:
	cd $(LAB) && latexmk -pdf -interaction=nonstopmode -outdir=build main.tex
	cp $(LAB)/build/main.pdf pdf/$(notdir $(LAB)).pdf
new:
	mkdir -p modules/$(MODULE)
	cp -r templates/lab-template modules/$(MODULE)/$(LAB)
	sed -i "s#../../shared#../../../shared#" modules/$(MODULE)/$(LAB)/main.tex
all:
	for d in modules/*/lab-*/; do $(MAKE) lab LAB=$${d%/}; done
clean:
	find modules -name build -type d -exec rm -rf {} +
