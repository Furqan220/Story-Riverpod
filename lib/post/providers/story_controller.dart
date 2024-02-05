// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';



class StroyPageController {
  PageController pageController;
  StoryController storyController;
  int pageIndex;
  int storyIndex;
  StroyPageController({
    required this.pageController,
    required this.storyController,
    required this.pageIndex,
    required this.storyIndex,
  });

  PageController  get _pageController =>  pageController; 
  StoryController  get _storyController =>  storyController; 
  int  get _pageIndex =>  pageIndex; 
  int  get _storyIndex =>  storyIndex; 

  StroyPageController copyWith({
    PageController? pageController,
    StoryController? storyController,
    int? pageIndex,
    int? storyIndex,
  }) {
    return StroyPageController(
      pageController: pageController ?? this.pageController,
      storyController: storyController ?? this.storyController,
      pageIndex: pageIndex ?? this.pageIndex,
      storyIndex: storyIndex ?? this.storyIndex,
    );
  }



  
}
