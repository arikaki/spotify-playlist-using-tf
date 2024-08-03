# Create a Spotify playlist with Terraform
This project involves using Terraform to create multiple Spotify playlists for different occasions like morning, evening, party night, etc. Terraform will be used to automate the creation and management of these playlists.

## Prerequisites

- Terraform Installed: Ensure Terraform is installed on your machine.
- Docker Installed: Make sure Docker is installed and running.
- Spotify Account: You need a Spotify account (without premium access)
- Spotify Developer Account: Register and create an application to get the Client ID and    Client Secret.
- Spotify Provider for Terraform: Install and configure the Spotify provider for Terraform.

##  Steps to create a playlist

### Create TF code
Create a main.tf or provider.tf file, and provide details:
```
terraform {
  required_providers {
    spotify = {
      source = "conradludgate/spotify"
      version = "0.2.7"
    }
  }
}

provider "spotify" {
  api_key = '?'
}
```

The provider for the spotify playlist can be referred from this [terraform provider](https://registry.terraform.io/providers/conradludgate/spotify/latest/docs)

### Need API key
To interact with Spotify's API, you need a Client ID and Client Secret.

### Start with App Creation
- Go to the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard).
- Log in with your Spotify account.
- Click on "Create an App".
- Fill in the required details and create the app. Redirect URIs: http://localhost:27228/spotify_callback

### Access Client ID and Client Secret
- Go to the settings in Dashboard 
- Note down Client ID and Client Secret

### Enter Details
Create a file named .env to store your Spotify application's Client ID and Secret:
```
SPOTIFY_CLIENT_ID=<your_spotify_client_id>
SPOTIFY_CLIENT_SECRET=<your_spotify_client_secret>
```

### Run the Spotify Auth App and Get the API Key
Make sure Docker Desktop is running, and start the authorization proxy server:
``` 
docker run --rm -it -p 27228:27228 --env-file .env ghcr.io/conradludgate/spotify-auth-proxy
```

Click on the Auth URL and click on agree button in the Agreement
You should get “Authorization Successful” message.

Note: Add API key in main.tf / provider.tf by creating terraform.tfvars and variables.tf file and map it to the api section created in the main.tf/variables.tf. As API key is a security sensitive data.  

### Add playlist or album to your spotify account
Create playlist.tf / album.tf in the same directory
```
resource "spotify_playlist" "playlist" {
  name        = "My playlist"
  description = "My playlist is so awesome"
  public      = false

  tracks = [
    data.spotify_track.overkill.id,
    data.spotify_track.blackwater.id,
    data.spotify_track.snowblind.id,
  ]
}

data "spotify_track" "overkill" {
  url = "https://open.spotify.com/track/4XdaaDFE881SlIaz31pTAG"
}
data "spotify_track" "blackwater" {
  url = "https://open.spotify.com/track/4lE6N1E0L8CssgKEUCgdbA"
}
data "spotify_track" "snowblind" {
  url = "https://open.spotify.com/track/7FCG2wIYG1XvGRUMACC2cD"
}
```


### Initialize and Apply Terraform Configuration
- Initialize the Terraform configuration:
```
terraform init
```
- Apply the Terraform configuration:
```
terraform apply
```

### Verify Playlists on Spotify

After applying the Terraform configuration, log in to your Spotify account and verify that the playlist / album have been created and populated with the specified tracks.

### Conclusion

By following these steps, you can automate the creation and management of multiple Spotify playlists using Terraform. This approach not only saves time but also ensures consistency across your playlists. Customize the playlists and tracks as per your preference to suit different occasions.
  