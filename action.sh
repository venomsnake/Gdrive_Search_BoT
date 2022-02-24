git clone https://venomsnake/Gdrive_Search_BoT /root/searchbot
cd searchbot
cp CREDS/config_sample.env /root/searchbot/config.env
pip3 install -r requirements.txt
sudo dockerd
sudo docker build . -t searchbot
sudo docker run searchbot
