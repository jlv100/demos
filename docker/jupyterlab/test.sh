
set -e 

echo "Begin notebook test"
#find . -name '*.ipynb' | grep -v '.ipynb_checkpoints'

NOTEBOOKS=("./Field Location Prediction.ipynb"
"./LIME demo.ipynb"
"./cancer_cell_morphology_mxnet.ipynb"
"./WDBC_1_data.ipynb"
"./WDBC_2_viz.ipynb"
"./WDBC_3_classification.ipynb"
"./PCA.ipynb"
"./mice_proteins_pca_plsda.ipynb"
"./mice_proteins_mxnet_autoencoder.ipynb"
"./mice_proteins_mxnet_classify.ipynb")

for NOTEBOOK in "${NOTEBOOKS[@]}"
do
    echo "Running $NOTEBOOK..."
    jupyter-nbconvert --output "${html/$NOTEBOOK.out}" --execute "${NOTEBOOK}"
done
