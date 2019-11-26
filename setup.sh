#!/usr/bin/env bash
################################################################################
#    Author: Wenxuan Zhang                                                     #
#     Email: wenxuangm@gmail.com                                               #
#   Created: 2019-11-26 14:06                                                  #
################################################################################
set -euo pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd) && cd "$SCRIPT_DIR" || exit 1

find scel -type f -exec scel2org {} \; | sort -u > all.org

[[ -f gbkpy.org ]] || wget https://raw.github.com/fcitx/fcitx/master/src/im/pinyin/data/gbkpy.org

createPYMB gbkpy.org all.org
mv pybase.mb pyphrase.mb ~/.config/fcitx/pinyin
rm py* all.org
