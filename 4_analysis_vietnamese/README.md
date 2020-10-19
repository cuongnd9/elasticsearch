# analysis_vietnamese

## settings

```shell script
curl -i -X PUT -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats -d @mappings/cats.json
```

## analyze

```shell script
curl -X POST 'http://127.0.0.1:9200/cats/_analyze' -H 'content-type: application/json' -d '{"analyzer": "vietnamese_analyzer", "text": "Xin chào, tôi là Nguyễn Duy Cương. Tôi là một nhà thơ."}'
```

## insert mocking data

```shell script
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "834bd32b-9497-46c8-ba6a-c52ffa736bd0", "name": "Cuong Nguyen", "bio": "Tôi là một con mèo hư hỏng"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "834bd32b-9497-46c8-ba6a-c52ffa734564", "name": "Cuong Tran", "bio": "Tôi là một nhà thơ"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "8367d78b-9497-46c8-ba6a-c52ffa734564", "name": "Cuong Tran", "bio": "Cương Trần là nhà phát triển phần mềm"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "8367d78b-9497-46c8-8563-c52ffa734564", "name": "Cuong Tran", "bio": "software engineer"}'
```

## search

> POST http://127.0.0.1:9200/cats/_search

*body*

```json
{
  "query": {
    "match": {
      "bio": {
        "query": "mèo hư hỏng",
        "analyzer": "vietnamese_analyzer"
      }
    }
  }
}
```
