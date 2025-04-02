# TODO

node_id: 8701cf24e3a089bdd61078988cae882f1e4a2258af952318e265302e1879459ee94e0b3f05ea698cea056abb65582da035aecc9401c414366821e405bde9345e
=== c'est la clé publique

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

- liste des blocks

```
curl -X 'GET' \
  'https://tara.to/api/v2/addresses/0x264A30E880D3b53bb2CdeB234E34201ebF9A9965/blocks-validated' \
  -H 'accept: application/json' | jq '.items[] | .hash + " (" + .timestamp + ") gas%:" + (.gas_used_percentage|floor|tostring) + " tx_c:" + (.transaction_count|tostring) + " tx_fees:" + (.transaction_fees|tostring)'

"0x33d5f03161862326e50e5e3bd770b7b941bd4bddff9f1ac97003d73f81ae8571 (2025-03-31T10:41:35.000000Z) gas%:5 tx_c:798 tx_fees:16749141"
"0xcf19db1134417a68daac0821d4a9a6edd941c6b9c6e8517b60e34668a3ebbf0e (2025-03-31T10:24:06.000000Z) gas%:0 tx_c:0 tx_fees:0"
"0xc4c49f9de78afcc1db2772a4fe8fa461be8820c98c37a7d091090727caaa26fe (2025-03-31T09:50:54.000000Z) gas%:2 tx_c:364 tx_fees:7841774"
"0x83af75fece33efd5a3c78ba8d1397f8f3d97effa696c911a34c6e0eed53ebcb9 (2025-03-30T20:43:55.000000Z) gas%:2 tx_c:388 tx_fees:8171773"
```

- remove labels from cadvisor exporter metrics to avoid different metrics set