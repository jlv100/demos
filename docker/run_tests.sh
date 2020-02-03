set -e
. /opt/conda/etc/profile.d/conda.sh
ls /tests/*.test | while read TEST
do
    ENVNAME=`basename $TEST .test`
    echo "Activating $ENVNAME..."
    conda activate $ENVNAME
    cat $TEST | while read NOTEBOOK
    do
        if [ ! -f "html/$NOTEBOOK.html" ]
        then
            echo "Running $NOTEBOOK..."
            if [[ $(grep '"language"' "$NOTEBOOK.ipynb" | grep python) ]]
            then
                KERNEL=python3
            else
                KERNEL=ir
            fi
            #jupyter nbconvert --in-place --clear-output --to notebook "${NOTEBOOK}.ipynb"
            jupyter nbconvert --ExecutePreprocessor.kernel_name=$KERNEL --ExecutePreprocessor.timeout=600 --to notebook --clear-output --output-dir "completed" --execute "${NOTEBOOK}.ipynb"
            jupyter nbconvert --to html --output-dir "html" "completed/${NOTEBOOK}.ipynb"
        fi
    done
    conda env export --from-history -n $ENVNAME > /environments_publish/$ENVNAME.yml
done

