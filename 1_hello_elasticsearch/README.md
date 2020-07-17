# hello_elasticsearch

## create cats index

```sh
curl -X PUT "http://127.0.0.1:9200/cats/"
```

*output*

```json
{
    "acknowledged": true,
    "shards_acknowledged": true,
    "index": "cats"
}
```

## insert record

```sh
curl -X POST 'http://127.0.0.1:9200/cats/cat' -H 'content-type: application/json' -d '{"name": "Chichi", "color": "yellow", "gender": "female"}'
```

*output*

```json
{
   "_index":"cats",
   "_type":"cat",
   "_id":"6WkmW3MB6LCE6op9zD6p",
   "_version":1,
   "result":"created",
   "_shards":{
      "total":2,
      "successful":1,
      "failed":0
   },
   "_seq_no":0,
   "_primary_term":1
}
```

## update record

```sh
curl -X PUT 'http://127.0.0.1:9200/cats/cat/6WkmW3MB6LCE6op9zD6p' -H 'content-type: application/json' -d '{"name": "Chichi", "color": "yellow black", "gender": "female"}'
```

*output*

```json
{
   "_index":"cats",
   "_type":"cat",
   "_id":"6WkmW3MB6LCE6op9zD6p",
   "_version":2,
   "result":"updated",
   "_shards":{
      "total":2,
      "successful":1,
      "failed":0
   },
   "_seq_no":1,
   "_primary_term":1
}
```

## search

### search all

```sh
curl -X GET 'http://127.0.0.1:9200/cats/_search'
```

*output*

```json
{
   "took":3,
   "timed_out":false,
   "_shards":{
      "total":1,
      "successful":1,
      "skipped":0,
      "failed":0
   },
   "hits":{
      "total":{
         "value":7,
         "relation":"eq"
      },
      "max_score":1.0,
      "hits":[
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"6WkmW3MB6LCE6op9zD6p",
            "_score":1.0,
            "_source":{
               "name":"Chichi",
               "color":"yellow black",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7Gl6W3MB6LCE6op9Mj5w",
            "_score":1.0,
            "_source":{
               "name":"Chichi",
               "color":"yellow",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7Wl6W3MB6LCE6op9VD4G",
            "_score":1.0,
            "_source":{
               "name":"Kiki",
               "color":"yellow",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7ml6W3MB6LCE6op9bj7L",
            "_score":1.0,
            "_source":{
               "name":"Kiki",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"72l6W3MB6LCE6op9hD48",
            "_score":1.0,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"8Gl6W3MB6LCE6op9iT4j",
            "_score":1.0,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"8Wl6W3MB6LCE6op9kz4I",
            "_score":1.0,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         }
      ]
   }
}
```

### search by keyword

```sh
curl -X GET 'http://127.0.0.1:9200/cats/_search?q=kiki'
```

*output*

```json
{
   "took":47,
   "timed_out":false,
   "_shards":{
      "total":1,
      "successful":1,
      "skipped":0,
      "failed":0
   },
   "hits":{
      "total":{
         "value":2,
         "relation":"eq"
      },
      "max_score":1.3862942,
      "hits":[
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7Wl6W3MB6LCE6op9VD4G",
            "_score":1.3862942,
            "_source":{
               "name":"Kiki",
               "color":"yellow",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7ml6W3MB6LCE6op9bj7L",
            "_score":1.3862942,
            "_source":{
               "name":"Kiki",
               "color":"green",
               "gender":"female"
            }
         }
      ]
   }
}
```

### search by field

```sh
curl -X GET 'http://127.0.0.1:9200/cats/_search?q=gender:female'
```

*output*

```json
{
   "took":5,
   "timed_out":false,
   "_shards":{
      "total":1,
      "successful":1,
      "skipped":0,
      "failed":0
   },
   "hits":{
      "total":{
         "value":7,
         "relation":"eq"
      },
      "max_score":0.05129329,
      "hits":[
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"6WkmW3MB6LCE6op9zD6p",
            "_score":0.05129329,
            "_source":{
               "name":"Chichi",
               "color":"yellow black",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7Gl6W3MB6LCE6op9Mj5w",
            "_score":0.05129329,
            "_source":{
               "name":"Chichi",
               "color":"yellow",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7Wl6W3MB6LCE6op9VD4G",
            "_score":0.05129329,
            "_source":{
               "name":"Kiki",
               "color":"yellow",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"7ml6W3MB6LCE6op9bj7L",
            "_score":0.05129329,
            "_source":{
               "name":"Kiki",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"72l6W3MB6LCE6op9hD48",
            "_score":0.05129329,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"8Gl6W3MB6LCE6op9iT4j",
            "_score":0.05129329,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         },
         {
            "_index":"cats",
            "_type":"cat",
            "_id":"8Wl6W3MB6LCE6op9kz4I",
            "_score":0.05129329,
            "_source":{
               "name":"Lala",
               "color":"green",
               "gender":"female"
            }
         }
      ]
   }
}
```
