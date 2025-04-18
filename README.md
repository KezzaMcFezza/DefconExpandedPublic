# DefconExpanded Public Repository

Welcome to the Public Repository of DefconExpanded, a Defcon project that aims to create the best user experience for Defcon players.
This repository contains the complete Frontend and Dackend implementation of DefconExpanded. While the backend source code is provided, you'll need to set up your own Apache/Nginx server configuration if you want to deploy the website.

## What's Included
Before anybody jumps to conclusions, no that .env file in the repository does not contain credentials. It is just a template :)

- **Frontend**: Complete HTML, CSS, and JavaScript for anyone to use, modify, or learn from
- **Backend**: Node.js server implementation that can be used for your own Defcon website or other projects
- **Dedcon Server Configuration**: Configuration files for hosting your own Dedcon servers using DefconExpanded's methods
- **Custom Dedcon Executables**: These contain the gamealert features for you to try out yourself!
- **Discord Integration**: Bot that tracks live games and detects game alerts sent by players
- **Log File Parsers**: Python scripts for extracting game data from Dedcon server logs
- **Custom Dedcon Executables**: Modified with game alert functionality for Discord integration
- **Template .env File**: This file contains no credentials, i have provided an empty copy for anyone to fill in their own to get up and running.

## How Does It Work?

### Recording System
The system took alot of fine tuning but this is the methods i used to make it work:

1. **Game Recording**: Dedcon servers automatically record game sessions as `.dcrec` `.d8crec` `.d10crec` files (d8crec, d10crec for the larger player count servers)
2. **Log Processing**: Python parsers extract detailed game data from server logs, creating `.json` files
3. **Backend Processing**: The Node.js backend monitors directories for new recordings and log files
4. **Database Integration**: When matching pairs of recording and log files are detected, the system:
   - Extracts player information, scores, territories, and game settings
   - Processes alliance data for team games
   - Calculates game statistics including duration, score differences, and win/loss records
   - Stores everything in a database (which i have provided)
   - Can be modified through a simple admin interface i created for my web admins.
5. **Frontend Display**: The website fetches and presents this data through various interfaces and filters

### Discord Integration
The Discord integration provides real-time updates about games:

1. **Game Alerts**: Players can use `/gamealert CUSTOM_MESSAGE` in-game to send messages to Discord
2. **Game Posting to Discord**: When games finish, the system automatically posts the game as a discord embed
3. **Map Visualization**: The system generates territory control maps showing player territories
4. **Player Stats**: Tries to be as close to the websites method of displaying the games
5. **Download Links**: Direct links to download recordings from the notification

### Detailed Game Statistics
Once the data has been stored on the database, it can then be parsed:

1. **Player Stats**: Tracks wins, losses, scores, and territory preferences
2. **Alliance Analysis**: Maps team structures and alliance changes during games
3. **Territory Statistics**: Calculates win rates by territory to identify advantages
4. **Nemesis Tracking**: Identifies player rivalries (known as player nemesis) based on win/loss patterns
5. **Sweet Graphs**: Generates graphs and territory maps for statistical analysis

## How to run?

### Why No Apache/Nginx Configuration?

Server configuration is a matter of personal preference. If you're capable of working with this codebase, setting up a web server should be within your capabilities.
If you dont want to setup a live website you can always just access the website through `localhost:3000` or `127.0.0.1`

### Database Setup

A MySQL database dump is included to help you set up your own local testing environment. This provides the table and column structure but does not contain production data from the DefconExpanded live site.

### Node.js

Before you get started install Node.js with npm
The version of node.js i am running is `v20.15.1` so if you would like to update to a new version thats upto you.

Open the command line inside the folder containing the project. and type `npm install`
This will install all the dependancies from `package-lock.json` for the node app to run

Currently the node.js app requires a .env file to run, which you will notice right away if you attempt to run the batch file. You can either modify the .env sample i have provided with your own data,
or you can just remove the dependancy altogether.

### DefconServerTracker.py

Go into your terminal and make sure you have python installed and type `pip install discord.py aiofiles python-dotenv`
This will install all the dependancies for the script to run

This file also requires a .env file to run. You can either remove the dependancy or setup the discord integration yourself

## Why Make It Public?

1. **Personal Reason**: I believe that what i have created here could be improved on and i am not scared to hide that fact
2. **Knowledge Sharing**: There are no guides for setting up a Defcon recording website, and figuring it out alone is challenging
3. **The Future**: Perhaps someone will create new projects based on this code, which i fully support
4. **It's a small community**: Defcon is a niche game with an even more niche development scene, and this repo aims to help those to dare attempt their own Defcon website

If you have any suggestions or potential improvements you can always do a pull request and i will review :)
