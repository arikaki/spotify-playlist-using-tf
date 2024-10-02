resource "spotify_playlist" "project" {
  name        = "My project playlist"
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


data "spotify_search_track" "LP" {
  artist = "Linkin Park"  
}

resource "spotify_playlist" "my_LP_playlist" {
  name = "LP_playlist"
  description = "My playlist is so awesome"
  public      = false

  tracks = [
    data.spotify_search_track.LP.tracks[0].id,
    data.spotify_search_track.LP.tracks[1].id,
    data.spotify_search_track.LP.tracks[2].id
  ]
}