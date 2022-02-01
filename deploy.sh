git clone https://venomsnake/Gdrive_Search_BoT /root/searchbot
cp CREDS/.env /root/searchbot/.env
cd /root/searchbot
sudo dockerd
sudo docker build . -t searchbot
sudo docker run searchbot
