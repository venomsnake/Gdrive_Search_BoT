git clone https://venomsnake/Gdrive_Search_BoT searchbot
cd searchbot
cp CREDS/config_sample.env config.env
pip3 install -r requirements.txt
sudo dockerd
sudo docker build . -t searchbot
sudo docker run searchbot
