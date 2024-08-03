resource "spotify_playlist" "project" {
  name        = "project playlist"
  description = "My playlist is so awesome"
  public      = false

  tracks = [
    "id2u1FWVxAb16qbgwPgygAdj",
    "47CK1SBOe7VR65GEmZmPjk"
  ]
}

/*
data "spotify_track" "overkill" {
  url = "https://open.spotify.com/track/4XdaaDFE881SlIaz31pTAG"
}
data "spotify_track" "blackwater" {
  url = "https://open.spotify.com/track/4lE6N1E0L8CssgKEUCgdbA"
}
data "spotify_track" "snowblind" {
  url = "https://open.spotify.com/track/7FCG2wIYG1XvGRUMACC2cD"
}
*/