git clone https://github.com/broadinstitute/CellBender.git
conda create -y -n CellBender python=3.7
conda init bash
exec bash
conda activate CellBender
conda install -y -c anaconda pytables
conda install -y pytorch torchvision -c pytorch
pip install -e CellBender