# TODO

- récupérer la version du noeud et la comparer à la version de rpc.mainnet.taraxa.io

```
curl -s -X POST --data '{"jsonrpc":"2.0","method":"taraxa_getVersion","params":[],"id":1}' http://62.210.92.112:7777 | jq .
```

- récupérer statut de synchro + alert :

```
curl -s -X POST --data '{"jsonrpc":"2.0","method":"get_node_status","params":[],"id":1}' http://62.210.92.112:7777 | jq .result.synced
```

- merger les résultats des scrape?

- récupérer les ips et address des noeuds connectés + graph

```
curl -s -X POST --data '{"jsonrpc":"2.0","method":"get_all_nodes","params":[],"id":1}' http://62.210.92.112:7777 | jq .
```

A recouper avec `curl -s -X POST --data '{"jsonrpc":"2.0","method":"get_account_address","params":[],"id":1}' http://62.210.92.112:7777 | jq .`
car la liste des noeuds retournée par `get_all_nodes` retourne les IP et node_id, et non les accounts derrière les noeuds.