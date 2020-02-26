set -e
. /opt/conda/etc/profile.d/conda.sh
ls /tests/*.test | while read TEST
do
    ENVNAME=`basename $TEST .test`
    echo "Installing $ENVNAME..."
    conda env create -f /environments/$ENVNAME.yml
    cp /environments/$ENVNAME.yml /environments_publish/$ENVNAME.yml
    echo "Activating $ENVNAME..."
    conda activate $ENVNAME
    cat $TEST | while read NOTEBOOK
    do
        echo "Running $NOTEBOOK..."
        if [[ $(grep '"language"' "$NOTEBOOK.ipynb" | grep python) ]]
        then
            KERNEL=python3
        else
            KERNEL=ir
        fi
        jupyter nbconvert --ExecutePreprocessor.kernel_name=$KERNEL --ExecutePreprocessor.timeout=600 --to notebook --inplace --execute "${NOTEBOOK}.ipynb"
    done
done

