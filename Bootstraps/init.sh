#!/bin/sh
PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
export PATH

BOOTSTRAP_PATH='../bootstrap.php'

if [ ! -e ${BOOTSTRAP_PATH} ]; then
  echo 'bootstrap.phpがありません'
  exit
fi

cat <<EOF >> ${BOOTSTRAP_PATH}
switch (env('CAKE_ENV_MODE')) {
    case 'development':
        // development
        require('Bootstrap/development_bootstrap.php');
        break;
    case 'production':
    default:
        // production
        require('Bootstrap/production_bootstrap.php');
        break;
}
EOF

echo 'bootstrap.phpに環境切り替え設定を挿入しました'

