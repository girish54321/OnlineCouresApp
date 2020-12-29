// // To parse this JSON data, do
// //
// //     final podcast = podcastFromJson(jsonString);

// import 'dart:convert';

// Podcast podcastFromJson(String str) => Podcast.fromJson(json.decode(str));

// String podcastToJson(Podcast data) => json.encode(data.toJson());

class Podcast {
  Podcast({
    this.podcast,
  });

  List<PodcastElement> podcast;

  factory Podcast.fromJson(Map<String, dynamic> json) => Podcast(
        podcast: json["podcast"] == null
            ? null
            : List<PodcastElement>.from(
                json["podcast"].map((x) => PodcastElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "podcast": podcast == null
            ? null
            : List<dynamic>.from(podcast.map((x) => x.toJson())),
      };
}

class PodcastElement {
  PodcastElement({
    this.name,
    this.imageUrl,
    this.genre,
  });

  String name;
  String imageUrl;
  String genre;

  factory PodcastElement.fromJson(Map<String, dynamic> json) => PodcastElement(
        name: json["name"] == null ? null : json["name"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        genre: json["genre"] == null ? null : json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "genre": genre == null ? null : genre,
      };
}
