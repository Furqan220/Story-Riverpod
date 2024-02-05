import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_work/post/notifiers/stories_notifier_provider.dart';
import 'package:story_work/post/views/story_card.dart';
import 'package:story_work/post/views/story_view.dart';

class WallFragment extends ConsumerWidget {
  const WallFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stories = ref.watch(storiesNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        title: const Text(
          'Walls',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .8,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 20.h),
        itemCount: stories.length,
        itemBuilder: (_, i) => InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => AllStoryView(
                      storyIndex: i,
                    ),
                  ),
                ),
            child: StoryCard(story: stories[0],),),
      ),
    );
  }
}
