export HOME=/tmp

cd /tmp
sh /create_environments.sh
cd /notebooks
jupyter notebook --no-browser --ip='0.0.0.0'
