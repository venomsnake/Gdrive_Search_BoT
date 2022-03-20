
# Drive Search Bot

This is a Telegram bot writen in Python for searching files in Drive. Based on [SearchX-bot](https://github.com/SVR666/SearchX-bot)

# How to deploy?

- Clone this repo

### Install requirements

- For Debian based distros
```
sudo apt install python3
sudo snap install docker 
```
- For Arch and it's derivatives:
```
sudo pacman -S docker python
```

## Setting up config file
```
cp config_sample.env config.env
```
- Remove the first line saying:
```
_____REMOVE_THIS_LINE_____=True
```
Fill up rest of the fields. Meaning of each fields are discussed below:
- `BOT_TOKEN`: The telegram bot token that you get from [@BotFather](https://t.me/BotFather)
- `OWNER_ID`: The Telegram user ID (not username) of the owner of the bot
- `AUTHORIZED_CHATS`: (optional) Fill user_id and chat_id (not username) of you want to authorize, Seprate them with space, Examples: `-0123456789 -1122334455 6915401739`.
- `TOKEN_PICKLE_URL`: (optional) Only if you want to load your **token.pickle** externally from an Index Link. Fill this with the direct link of that file.
- `DRIVE_FOLDER_URL`: (optional) Only if you want to load your **drive_folder** externally from an Index Link. Fill this with the direct link of that file.

## Upgrading.

If you are coming from last version where recursive searching was not possible, you must run driveid.py again and delete all previous content, and this time you just have to add Drives (Teamdrive or 'root' for Main Drive). See the section below for more.


## Setting up drive_folder file

- The bot can now search in sub-directories, so you just need to specify the teamdrives you want to use. To use main Drive, you can enter 'root' in the Drive id.
- Add Drive name (anything that you likes), Drive id & Index url (optional) corresponding to each id.
- Run `driveid.py` and follow the screen.
```
python3 driveid.py
```

## Getting Google OAuth API credential file

- Visit the [Google Cloud Console](https://console.developers.google.com/apis/credentials)
- Go to the OAuth Consent tab, fill it, and save.
- Go to the Credentials tab and click Create Credentials -> OAuth Client ID
- Choose Desktop and Create.
- Use the download button to download your **credentials.json**.
- Move that file to the root of searchbot, and rename it to credentials.json
- Visit [Google API page](https://console.developers.google.com/apis/library)
- Search for Drive and enable it if it is disabled
- Finally, run the script to generate token file **token.pickle** for Google Drive:
```
pip install google-api-python-client google-auth-httplib2 google-auth-oauthlib
python3 generate_drive_token.py
```

## Deploying on Server
- Start docker daemon (skip if already running):
```
sudo dockerd
```
- Build Docker image:
```
sudo docker build . -t searchbot
```
- Run the image:
```
sudo docker run searchbot
```

## Deploying on Heroku
- Give a star and Fork this repo
- Upload **token.pickle** and **drive_folder** to your forks, or you can upload your **token.pickle** and **drive_folder** to your Index and put your **token.pickle** and **drive_folder** link to `TOKEN_PICKLE_URL` and `DRIVE_FOLDER_URL`.
- Hit the **DEPLOY TO HEROKU** button and follow the further instructions in the screen (**NOTE**: If vars not coming, just change deploy link to your fork, Example: `https://dashboard.heroku.com/new?template=https://github.com/yourgithubname/drive-searchbot`).

<p><a href="https://heroku.com/deploy"> <img src="https://img.shields.io/badge/Deploy%20to%20Heroku-blueviolet?style=for-the-badge&logo=heroku" width="200""/></a></p>

## Deploying on Railway
- Give a star and Fork this repo
- Upload **token.pickle** and **drive_folder** to your forks, or you can upload your **token.pickle** and **drive_folder** to your Index and put your **token.pickle** and **drive_folder** link to `TOKEN_PICKLE_URL` and `DRIVE_FOLDER_URL`.
- Hit the **DEPLOY TO RAILWAY** button and follow the further instructions in the screen.

<p><a href="https://railway.app/new/template?template=https%3A%2F%2Fgithub.com%2Fvenomsnake%2FGdrive_Search_BoT&plugins=postgresql&envs=BOT_TOKEN%2COWNER_ID%2CAUTHORIZED_CHATS%2CTOKEN_PICKLE_URL%2CDRIVE_FOLDER_URL&optionalEnvs=AUTHORIZED_CHATS%2CTOKEN_PICKLE_URL%2CDRIVE_FOLDER_URL&BOT_TOKENDesc=The+Telegram+bot+token+that+you+get+from+https%3A%2F%2Ft.me%2FBotFather.&OWNER_IDDesc=The+Telegram+User+ID+of+the+Owner+of+the+Bot.+Get+it+by+using+%2Finfo+in+https%3A%2F%2Ft.me%2FMissRose_bot.&AUTHORIZED_CHATSDesc=Fill+User+ID+and+Chat+ID+of+you+want+to+authorize%2C+Seprate+them+with+space.&TOKEN_PICKLE_URLDesc=Only+if+you+want+to+load+your+token.pickle+externally+from+an+index+link.+Fill+this+with+the+direct+link+of+that+file.&DRIVE_FOLDER_URLDesc=Only+if+you+want+to+load+your+drive_folder+externally+from+an+index+link.+Fill+this+with+the+direct+link+of+that+file.&referralCode=Hafitz"> <img src="https://img.shields.io/badge/Deploy%20to%20Railway-blueviolet?style=for-the-badge&logo=railway" width="200""/></a></p>

## Deploying on Github Workflow
- Give a star and Fork this repo.
- Upload your **token.pickle** and **drive_folder** to your Index and put your **token.pickle** and **drive_folder** link to `TOKEN_PICKLE_URL` and `DRIVE_FOLDER_URL`.
- Create a Private Repo
Forked repo can't be switched to private, so you have to create this on your own. This repo is supposed to contain
- `.env`
or
- `config_sample.env` (with all variable filled)

## Add Secrets in Public Repo aka this repo
As your forked repo is going to stay public or you won't get unlimited Action time you've to add some secrets. So that you can access the data of your private repo. Go to https://{your_forked_repo}/settings/secrets/actions to add secrets.

You've to add these following secrets -

- `GH_NAME` : Your GitHub username.
- `GH_MAIL` : Mail that you use to sign into GitHub.
- `CREDS` : Link to your private repo but without (https://) eg. github.com/{username}/{private repo}.
- `GH_TOKEN` : Go to https://github.com/settings/tokens to generate a token. Tick repo, workflow and user and hit generate. Copy the token and add it to the secrets.
- `GH_REPO` : Your current repo. `username/reponame` e.g. venomsnake/Gdrive_Search_BoT
- `TZ` : Timezone. Findout your timezone and put it in your secret. e.g. Asia/Delhi.

## Deploy Your Bot
Our work is done. Now run a workflow and check the logs. If everything goes well your bot will restart in every six hours. You can check loop.txt to know when your bot was restarted.

# Credits:

- [`lzzy12`](https://github.com/lzzy12) for python-aria-mirror-bot
- [`SVR666`](https://github.com/SVR666) for SearchX-bot

