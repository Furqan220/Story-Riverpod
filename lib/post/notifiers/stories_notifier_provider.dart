import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:story_work/post/providers/stories_provider.dart';
import 'package:story_work/post/providers/story_provider.dart';
part 'stories_notifier_provider.g.dart';


@Riverpod(keepAlive: true)
class StoriesNotifier extends _$StoriesNotifier {
  
  // to get all story images 
  List<StoryImage?> getAllStoryImages(){
     List<StoryImage?> allStoryImages = [];
     for (final e in state) {
      allStoryImages.addAll(e.storyImages);
     }
    return allStoryImages;
  }

  @override
  List<Story> build() {
    return [
      Story(
        isMe: false,
        userAvatar: 'assets/images/carousel_image_2.png',
        userName: 'Annabelle',
        storyImages: [
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_1.png',
            caption: 'nice',
          ),
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_2.png',
            caption: 'nice',
          ),
        ],

      ),
      Story(
        isMe: false,
        userAvatar: 'assets/images/carousel_image_2.png',
        userName: 'Anika',
        storyImages: [
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_1.png',
            caption: 'nice',
          ),
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_2.png',
            caption: 'nice',
          ),
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_2.png',
            caption: 'nice',
          ),
        ],

      ),
      Story(
        isMe: false,
        userAvatar: 'assets/images/carousel_image_2.png',
        userName: 'Annabelle',
        storyImages: [
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_1.png',
            caption: 'nice',
          ),
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_2.png',
            caption: 'nice',
          ),
        ],

      ),
      Story(
        isMe: false,
        userAvatar: 'assets/images/carousel_image_2.png',
        userName: 'Anika',
        storyImages: [
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_1.png',
            caption: 'nice',
          ),
          StoryImage(
            imageType: 'asset',
            image: 'assets/images/carousel_image_2.png',
            caption: 'nice',
          ),
        ],

      ),
    ];
  }
}
