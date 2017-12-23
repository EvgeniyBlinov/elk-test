curl localhost:9200/_cat/indices?v

watch -n 1 bin/generate.sh

bin/generate.sh clear

sysctl -w vm.max_map_count=262144
