sed -i s/\$BB_TOKEN/$BB_TOKEN/ antora-playbook.yml
DOCSEARCH_ENABLED=true DOCSEARCH_ENGINE=lunr NODE_PATH="$(npm -g root)" antora --fetch --generator antora-site-generator-lunr antora-playbook.yml
