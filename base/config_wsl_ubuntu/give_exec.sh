#!/bin/bash
set -e
find . -type f -name "*.sh" -print -exec chmod +x {} \;
echo '完成！'
read -s -n 1 -p "按任意键退出..."
echo ''
