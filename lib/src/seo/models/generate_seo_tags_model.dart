class GenerateSeoTagsModel {
  GenerateSeoTagsDataModel? metaTags;

  GenerateSeoTagsModel({
    this.metaTags,
  });

  factory GenerateSeoTagsModel.fromJson(Map<String, dynamic> json) => GenerateSeoTagsModel(
    metaTags: json['meta_tags'] == null ? null : GenerateSeoTagsDataModel.fromJson(json['meta_tags']),
  );
}

class GenerateSeoTagsDataModel {
  String? title;
  String? keywords;
  String? description;
  String? author;
  String? ogUrl;
  String? ogType;
  String? ogImage;
  String? ogTitle;
  String? ogSiteName;
  String? ogDescription;
  String? twitterCard;
  String? twitterImage;
  String? twitterTitle;
  String? twitterCreator;
  String? twitterDescription;

  GenerateSeoTagsDataModel({
    this.title,
    this.keywords,
    this.description,
    this.author,
    this.ogUrl,
    this.ogType,
    this.ogImage,
    this.ogTitle,
    this.ogSiteName,
    this.ogDescription,
    this.twitterCard,
    this.twitterImage,
    this.twitterTitle,
    this.twitterCreator,
    this.twitterDescription,
  });

  factory GenerateSeoTagsDataModel.fromJson(Map<String, dynamic> json) => GenerateSeoTagsDataModel(
    title: json['title'],
    keywords: json['keywords'],
    description: json['description'],
    author: json['author'],
    ogUrl: json['og:url'],
    ogType: json['og:type'],
    ogImage: json['og:image'],
    ogTitle: json['og:title'],
    ogSiteName: json['og:site_name'],
    ogDescription: json['og:description'],
    twitterCard: json['twitter:card'],
    twitterImage: json['twitter:image'],
    twitterTitle: json['twitter:title'],
    twitterCreator: json['twitter:creator'],
    twitterDescription: json['twitter:description'],
  );
}