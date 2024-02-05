import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:story_view/story_view.dart';
import 'package:story_work/post/providers/story_controller.dart';
part 'story_controller_notifier.g.dart';


@Riverpod(keepAlive: true)
class StoriesControllerNotifier extends _$StoriesControllerNotifier {

  void setPageIndex(int v) 
  {
    state.pageIndex = v;
  }

  void setStoryIndex(int v) 
  {
    state.storyIndex = v;
  }

  @override
  StroyPageController build(){
    return StroyPageController(
      pageController: PageController(),
      storyController: StoryController(),
      pageIndex: 0,
      storyIndex: 0,
    );
  }
}
