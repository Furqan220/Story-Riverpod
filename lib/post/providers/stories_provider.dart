import 'package:equatable/equatable.dart';
import 'package:story_work/post/providers/story_provider.dart';




// ignore: must_be_immutable
class Story extends Equatable{
  Story({
    this.userName,
    this.userAvatar,
    this.storyImages = const [],
    this.isMe,
  });

  String? userName;
  String? userAvatar;
  bool? isMe;
  List<StoryImage?> storyImages  ;

  Story copWith({
    String? userName, 
    String? userAvatar,
    bool? isMe,
    List<StoryImage?>? storyImages  ,
  }) {
    return Story(
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      isMe: isMe ?? this.isMe,
      storyImages: storyImages ?? this.storyImages ,
    );
  }

  @override
  List<Object?> get props => [
        userName,
        userAvatar,
        storyImages,
        isMe,
      ];
}