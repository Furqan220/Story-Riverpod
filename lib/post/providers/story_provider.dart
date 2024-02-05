import 'package:equatable/equatable.dart';
// ignore: must_be_immutable
class StoryImage extends Equatable {
  StoryImage({
    this.image,
    this.imageType,
    this.caption,
  });
  String? image;
  String? imageType;
  String? caption;

  StoryImage copWith({
    String? image,
    String? imageType,
    String? caption,
  }) {
    return StoryImage(
      image: image ?? this.image,
      imageType: imageType ?? this.imageType,
      caption: caption ?? this.caption,
    );
  }

  @override
  List<Object?> get props => [
        image,
        imageType,
        caption,
      ];
}
