# kashi

歌ネットさんから歌詞を取得して表示するツール。Amazon Echoで音楽聴きながらシェルで作業してるときに一瞬で歌詞表示したいがために作った。  
タイトル・歌手・作詞家・作曲家名での検索に対応。さらに検索結果はfzfでインタラクティブに絞り込み・選択できるUIを備える。  
ただWebページを2回取得してるだけなのでブラウザでやってることと変わらない。よって規約違反にはあたらないと信じる。

## Docker Image

[sumajirou / kashi - Docker Hub](https://hub.docker.com/repository/docker/sumajirou/kashi)

## 使用方法

```shell
$ alias kashi='docker run --rm -it sumajirou/kashi:0.1.1'
$ kashi --help
kashi は歌ネット(www.uta-net.com)から歌詞を検索して表示するCLIツールです．
オプションを指定しない時は歌手名で検索します．
複数のオプションを指定した場合最後のオプションのみ有効です．

Usage:
  kashi [<options>] 検索ワード

Options:
  -t, --title    曲名         曲名で検索
  -a, --artist   歌手名       歌手名で検索
  -l, --lyricist 作詞家名     作詞家名で検索
  -c, --composer 作曲家名     作曲家名で検索
  -h, --help                  ヘルプを表示

$ kashi BABYMETAL
```

