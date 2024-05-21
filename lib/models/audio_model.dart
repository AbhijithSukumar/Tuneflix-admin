class AudioModel {
  final String fileName;
  final String thumbnail;
  final String description;
  final String genre;
  final String title;
  final int releaseYear;
  final String productionID;
  final bool isPrime;
  final String audioID;

  AudioModel(
      {required this.fileName,
      required this.thumbnail,
      required this.description,
      required this.genre,
      required this.title,
      required this.releaseYear,
      required this.productionID,
      required this.isPrime,
      required this.audioID
      });

factory AudioModel.fromMap(Map<String, dynamic> videoMap) {
  return AudioModel(
    fileName: videoMap["fileName"]?.toString() ?? "",
    thumbnail: videoMap["thumbnail"]?.toString() ?? "",
    description: videoMap["description"]?.toString() ?? "",
    genre: videoMap["genre"]?.toString() ?? "",
    title: videoMap["title"]?.toString() ?? "",
    releaseYear: videoMap["releaseYear"]?.toInt() ?? 0, // Handle int conversions safely
    productionID: videoMap["production"]?.toString() ?? "",
    isPrime: videoMap["isPrime"],
    audioID: videoMap["_id"]?.toString() ?? "",
  );
}

}


