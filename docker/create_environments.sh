
echo "Creating environments.  This may take some time..."
cd
cp /environments/*.yml ./
ls -1 *.yml | while read YAML
do
    echo "Creating $YAML..."
    conda env create -f $YAML
done
