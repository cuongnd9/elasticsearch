# settings_mappings_filters_analyzers

## settings

```sh
curl -X GET 'http://127.0.0.1:9200/cats/_settings'
```

*output*

```json
{
   "cats":{
      "settings":{
         "index":{
            "creation_date":"1594962136059",
            "number_of_shards":"1",
            "number_of_replicas":"1",
            "uuid":"gUvNeCSHRlGoT4fT0PXUMQ",
            "version":{
               "created":"7080099"
            },
            "provided_name":"cats"
         }
      }
   }
}
```

## mappings

```sh
curl -X GET 'http://127.0.0.1:9200/cats/_mappings'
```

*output*

```json
{
   "cats":{
      "mappings":{
         "properties":{
            "color":{
               "type":"text",
               "fields":{
                  "keyword":{
                     "type":"keyword",
                     "ignore_above":256
                  }
               }
            },
            "gender":{
               "type":"text",
               "fields":{
                  "keyword":{
                     "type":"keyword",
                     "ignore_above":256
                  }
               }
            },
            "name":{
               "type":"text",
               "fields":{
                  "keyword":{
                     "type":"keyword",
                     "ignore_above":256
                  }
               }
            }
         }
      }
   }
}
```

## analyzers

```sh
curl -X POST 'http://127.0.0.1:9200/_analyze' -H 'content-type: application/json' -d '{"analyzer": "standard", "text": "I am Cuong Duy Tran"}'
```

*output*

```json
{
   "tokens":[
      {
         "token":"i",
         "start_offset":0,
         "end_offset":1,
         "type":"<ALPHANUM>",
         "position":0
      },
      {
         "token":"am",
         "start_offset":2,
         "end_offset":4,
         "type":"<ALPHANUM>",
         "position":1
      },
      {
         "token":"cuong",
         "start_offset":5,
         "end_offset":10,
         "type":"<ALPHANUM>",
         "position":2
      },
      {
         "token":"duy",
         "start_offset":11,
         "end_offset":14,
         "type":"<ALPHANUM>",
         "position":3
      },
      {
         "token":"tran",
         "start_offset":15,
         "end_offset":19,
         "type":"<ALPHANUM>",
         "position":4
      }
   ]
}
```

```sh
curl -X PUT 'http://127.0.0.1:9200/newcats' -H 'content-type: application/json' -d '{"settings":{"analysis":{"filter":{"stemmer":{"type":"stemmer","language":"english"},"stopwords":{"type":"stop","stopwords":["_english_"]}},"analyzer":{"custom_analyzer":{"filter":["stopwords","lowercase","stemmer"],"type":"custom","tokenizer":"standard"}}}},"mappings":{"properties":{"name":{"type":"text","analyzer":"custom_analyzer","search_analyzer":"custom_analyzer"},"color":{"type":"text","analyzer":"custom_analyzer","search_analyzer":"custom_analyzer"},"gender":{"type":"text","analyzer":"custom_analyzer","search_analyzer":"custom_analyzer"}}}}'
```

*details settings*

``json
{
   "settings":{
      "analysis":{
         "filter":{
            "stemmer":{
               "type":"stemmer",
               "language":"english"
            },
            "stopwords":{
               "type":"stop",
               "stopwords":[
                  "_english_"
               ]
            }
         },
         "analyzer":{
            "custom_analyzer":{
               "filter":[
                  "stopwords",
                  "lowercase",
                  "stemmer"
               ],
               "type":"custom",
               "tokenizer":"standard"
            }
         }
      }
   },
   "mappings":{
      "properties":{
         "name":{
            "type":"text",
            "analyzer":"custom_analyzer",
            "search_analyzer":"custom_analyzer"
         },
         "color":{
            "type":"text",
            "analyzer":"custom_analyzer",
            "search_analyzer":"custom_analyzer"
         },
         "gender":{
            "type":"text",
            "analyzer":"custom_analyzer",
            "search_analyzer":"custom_analyzer"
         }
      }
   }
}
```

*output*

```json
{
    "acknowledged": true,
    "shards_acknowledged": true,
    "index": "newcats"
}
```

```sh
curl -X POST 'http://127.0.0.1:9200/newcats/_analyze' -H 'content-type: application/json' -d '{"analyzer": "custom_analyzer", "text": "I am a data engineer"}'
```

*output*

```json
{
   "tokens":[
      {
         "token":"i",
         "start_offset":0,
         "end_offset":1,
         "type":"<ALPHANUM>",
         "position":0
      },
      {
         "token":"am",
         "start_offset":2,
         "end_offset":4,
         "type":"<ALPHANUM>",
         "position":1
      },
      {
         "token":"data",
         "start_offset":7,
         "end_offset":11,
         "type":"<ALPHANUM>",
         "position":3
      },
      {
         "token":"engin",
         "start_offset":12,
         "end_offset":20,
         "type":"<ALPHANUM>",
         "position":4
      }
   ]
}
```

## reindex

```sh
curl -X POST 'http://localhost:9200/_reindex' -H 'content-type: application/json' -d '{"source":{"index":"cats"},"dest":{"index":"newcats"}}'
```

*output*

```json
{
    "took": 63,
    "timed_out": false,
    "total": 4,
    "updated": 0,
    "created": 4,
    "deleted": 0,
    "batches": 1,
    "version_conflicts": 0,
    "noops": 0,
    "retries": {
        "bulk": 0,
        "search": 0
    },
    "throttled_millis": 0,
    "requests_per_second": -1.0,
    "throttled_until_millis": 0,
    "failures": []
}
```
