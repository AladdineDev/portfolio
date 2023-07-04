class Project {
  final String title;
  final String description;
  final List<String>? technologies;
  final String url;
  final String photoUrl;

  const Project({
    required this.title,
    required this.description,
    this.technologies,
    required this.url,
    required this.photoUrl,
  });
}
