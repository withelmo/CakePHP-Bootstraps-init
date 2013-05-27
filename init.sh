#!/bin/sh
PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
export PATH

BOOTSTRAP_PATH='../bootstrap.php'

if [ ! -e ${BOOTSTRAP_PATH} ]; then
  echo 'bootstrap.phpがありません'
  exit
fi

cat <<EOF >> ${BOOTSTRAP_PATH}
// For CakePHP Bootstraps-ini
switch (env('CAKE_ENV_MODE')) {
    case 'development':
        require('Bootstraps/development_bootstrap.php');
        break;
    case 'staging':
        require('Bootstraps/staging_bootstrap.php');
        break;
    case 'production':
    default:
        require('Bootstraps/production_bootstrap.php');
        break;
}
EOF

echo 'bootstrap.phpに環境切り替え設定を挿入しました'

