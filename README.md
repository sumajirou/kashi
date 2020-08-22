# kashi

歌ネットさんから歌詞を取得して表示するツール。Amazon Echoで音楽聴きながらシェルで作業してるときに一瞬で歌詞表示したいがために作った。

タイトル・歌手・作詞家・作曲家名での検索に対応。さらに検索結果はfzfでインタラクティブに絞り込み・選択できるUIを備える。

ただWebページを2回取得してるだけなのでブラウザでやってることと変わらない。よって規約違反にはあたらないと信じる。

ベータ版なので導入作業が必要。(環境に良くない！)そのうちDocker化する。

導入手順
```shell
brew install fzf
brew install ruby
gem install nokogiri
gem install addressable
```
