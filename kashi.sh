#!/usr/bin/env bash

set -eo pipefail

cd $(dirname $0)

function usage() {
  cat <<EOF
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
  -h, --help                 ヘルプを表示

EOF
}

OPT=$(getopt -o talch -l title,artist,lyricist,composer,help -- "$@")
if [ $? != 0 ]; then
  exit 1
fi
eval set -- "$OPT"

a_select=1
while true; do
  case $1 in
  -t | --title)
    a_select=2
    shift
    ;;
  -a | --artist)
    a_select=1
    shift
    ;;
  -l | --lyricist)
    a_select=3
    shift
    ;;
  -c | --composer)
    a_select=8
    shift
    ;;
  -h | --help)
    usage
    exit 0
    ;;
  --)
    shift
    break
    ;;
  *)
    echo "Internal error!" 1>&2
    exit 1
    ;;
  esac
done

if [ -z $1 ]; then
  usage
  exit 0
fi

URL="https://www.uta-net.com/search/?Aselect=${a_select}&Keyword=${1}&Bselect=3&sort=4"
list=$(./search.rb $URL)
if [ $? != 0 ]; then
  exit 1
fi
echo "$list" |
  column -t -s "	" |
  fzf --reverse --height 40% |
  awk '{print $NF}' |
  xargs ./get_lyrics.rb
