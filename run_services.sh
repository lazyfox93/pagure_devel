#!/bin/bash
set -e
sed -i 's/\/usr\/share\/pagure\/alembic/\/pagure\/alembic/g' files/alembic.ini
cat <<EOT >> ./pagure/default_config.py
THEME_TEMPLATE_FOLDER='/pagure-dist-git/template'
THEME_STATIC_FOLDER='/pagure-dist-git/static'
EOT
python createdb.py --initial files/alembic.ini
pip install mock
redis-server --daemonize yes
nohup python ./runworker.py &
nohup python ./runserver.py --host 0.0.0.0 &
