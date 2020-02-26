
echo "Creating environments.  This may take some time..."
ls -1 /environments/*.yml | while read YAML
do
    echo "Creating $YAML..."
    conda env create -f $YAML
done
