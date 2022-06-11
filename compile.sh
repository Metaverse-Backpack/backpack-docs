rm -rf public
mkdir public
pandoc --standalone --from=markdown --to=html --template=template/template.html --output=public/index.html --table-of-contents --css=template/template.css --toc-depth=4 --self-contained --resource-path=. index.md