# Ruby tf-idf Cosine-Similarity
The Programming Assignment 2 report from NTU101-1 IR course

**by NTU [Michael Hsu](http://michaelhsu.tw/ "blog")**

## 資料準備工作

因為 `IRTM_news_files` 的 data 有簽保密條約，請自行取得後放在 `/IRTM_news_files` 目錄下。

## Getting Start: 

使用 CLI 步驟執行程式，順序以及 output 結果如下

### 0. 利用 [PA1](https://github.com/evenchange4/101-1_IR_PA1_extractor) 的 term extractor 找出`每一份` document 的 terms，存在 /output/terms_hash/ 中。

```
$ ruby 0_loop-to-extract.rb

output 
=> /output/terms_hash/1.txt
```

### 1. 把所有出現的 term 做出一個 dictionary，我在使用上先存進 hash table，然後 output file 為一個 dictionary_hash.txt。

```
$ ruby 1_construct-dictionary.rb

output 
=> /output/dictionary_hash.txt
```

### 2. 讀取每一份 document 的 terms，對應到 dictionary_hash.txt，算出 tf-idf-unit-vector，並且存放到 /output/tf-idf_hash 中，為`每一份` document 的 tf-idf。
 
```
$ ruby 2_tf-idf.rb

output
=> /output/tf-idf_hash/1.txt
```


### 3. 丟進兩個 argument 當作兩份 document 的 id，並且開啓這兩份的 tf-idf_hash 進行運算，得到 cosine_similaity 的值並且印出來。

```
$ ruby 3_cosine_similaity.rb 1 2

=> cosine similarity of document 1 and 2
=> 0.18284016135760092
```

### 4. 因為繳交的格式的限制，另外寫一段 code 把 dictionary_hash.txt 轉換成易讀格式 dictionary.txt。

```
$ ruby 4_format.rb

output
=> dictionary.txt 以及 vector1.txt
```

## ....詳細說明請看 `report.pdf`
