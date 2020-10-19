# analysis_vietnamese

## settings

```shell script
curl -i -X PUT -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats -d @mappings/cats.json
```

## analyze

```shell script
curl -X POST 'http://127.0.0.1:9200/cats/_analyze' -H 'content-type: application/json' -d '{"analyzer": "vietnamese_analyzer", "text": "Là một con mèo hư hỏng."}'
```

## insert mocking data

```shell script
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "834bd32b-9497-46c8-567a-59iru4036bd0", "name": "Cuong Nguyen", "bio": "Duy là sinh viên đại học", "bio_2": "Duy là sinh viên đại học"}, "bio_3": "Duy là sinh viên đại học"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "834bd32b-9497-46c8-ba6a-c52ffa736bd0", "name": "Cuong Nguyen", "bio": "Tân đang học mỹ thuật", "bio_2": "Tân đang học mỹ thuật", "bio_3": "Tân đang học mỹ thuật"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "834bd32b-9497-46c8-ba6a-c52ffa734564", "name": "Cuong Tran", "bio": "Thư đang học nghệ thuật", "bio_2": "Thư đang học nghệ thuật", "bio_3": "Thư đang học nghệ thuật"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "8367d78b-9497-46c8-ba6a-c52ffa734564", "name": "Cuong Tran", "bio": "Hợi đang du học ở Mỹ", "bio_2": "Hợi đang du học ở Mỹ", "bio_3": "Hợi đang du học ở Mỹ"}'
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/cats/_doc -d '{"id": "8367d78b-9497-46c8-8563-c52ffa734564", "name": "Cuong Tran", "bio": "VN đang đá bóng ở sân Mỹ Đình", "bio_2": "VN đang đá bóng ở sân Mỹ Đình", "bio_3": "VN đang đá bóng ở sân Mỹ Đình"}'
```

## search

```shell script
curl -X POST -H "Accept:application/json" -H  "Content-Type:application/json" 'http://127.0.0.1:9200/cats/_search' -d '{"query":{"match":{"bio": {"query":"đại học Mỹ", "analyzer":"vietnamese_analyzer"}}}}'
curl -X POST -H "Accept:application/json" -H  "Content-Type:application/json" 'http://127.0.0.1:9200/cats/_search' -d '{"query":{"match":{"bio_2": {"query":"đại học Mỹ", "analyzer":"vietnamese_analyzer_2"}}}}'
curl -X POST -H "Accept:application/json" -H  "Content-Type:application/json" 'http://127.0.0.1:9200/cats/_search' -d '{"query":{"match":{"bio_3": {"query":"đại học Mỹ", "analyzer":"vietnamese_analyzer_2"}}}}'
```

```json
{
  "query": {
    "match": {
      "bio": {
        "query": "đại học Mỹ",
        "analyzer": "vietnamese_analyzer"
      }
    }
  }
}
```

```json
{
  "query": {
    "match": {
      "bio_2": {
        "query": "đại học Mỹ",
        "analyzer": "vietnamese_analyzer_2"
      }
    }
  }
}
```

```json
{
  "query": {
    "match": {
      "bio_3": {
        "query": "đại học Mỹ",
        "analyzer": "vi_analyzer"
      }
    }
  }
}
```
