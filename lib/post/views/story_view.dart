import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';
import 'package:story_work/post/notifiers/stories_notifier_provider.dart';
import 'package:story_work/post/notifiers/story_controller_notifier.dart';
import 'package:story_work/post/providers/stories_provider.dart';
import 'package:story_work/post/providers/story_provider.dart';
import 'package:story_work/post/views/story_card.dart';

class AllStoryView extends ConsumerStatefulWidget {
  const AllStoryView({required this.storyIndex, super.key});
  final int storyIndex;

  @override
  ConsumerState<AllStoryView> createState() => _AllStoryViewState();
}

class _AllStoryViewState extends ConsumerState<AllStoryView> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.transparent, // navigation bar color
    // statusBarColor: Colors.white, // status bar color
    //   statusBarIconBrightness: Brightness.dark,

    // ),);
  }

  @override
  Widget build(BuildContext context) {
    final stories = ref.watch(storiesNotifierProvider);
    final storyController = ref.watch(storiesControllerNotifierProvider);
    // final allStories =
    // ref.read(storiesNotifierProvider.notifier).getAllStoryImages();

    final controller = StoryController();
    final pageController = PageController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: stories.length,
        controller: storyController.pageController,
        onPageChanged: (v) {

          ref.read(storiesControllerNotifierProvider.notifier).setPageIndex(v);
        },
        itemBuilder: (_, i) {
          return Stack(
            children: [
            StoryView(
                controller: controller, // pass controller here too
                onComplete: () {
                  if(storyController.pageIndex == stories.length -1){
                    Navigator.pop(context);
                  }
                  storyController.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,);
                },
                onVerticalSwipeComplete: (direction) {
                  if (direction == Direction.down) {
                    Navigator.pop(context);
                  }
                },
                // onStoryShow: (storyItem) {
                  
                  // ref
                  //   .read(storiesControllerNotifierProvider.notifier)
                  //   .setStoryIndex(storyItem.view),
                // },
                indicatorColor: Colors.white,

                indicatorForegroundColor: const Color(0xff8A2387),

                storyItems: List.generate(
                  stories[i].storyImages.length,
                  (index) {
                    final storyItem = stories[i].storyImages[index];
                    // print(inde);
                    return StoryItem(
                      Container(
                        height: 1.sh,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(storyItem!.image ?? ''),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0XFF000000),
                                const Color(0xffFFFFFF).withOpacity(0),
                                Colors.transparent,
                                const Color(0xffFFFFFF).withOpacity(0),
                                const Color(0XFF000000),
                              ],
                            ),
                          ),
                        ),
                      ),
                      duration: const Duration(seconds: 3),
                    );
                  },
                ),
              ),
              Container(
                height: 1.sh,
                width: 1.sw,
                padding: EdgeInsets.only(
                  top: 40.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 30.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 48.h,
                              width: 48.w,
                              child: ClipOval(
                                child: Image.asset(
                                  stories[i].userAvatar ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            10.w.horizontalSpace,
                            Text(
                              stories[i].userName ?? '',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // print('button Pressed');
                            Navigator.pop(context);
                          },
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            fixedSize: Size(48.w, 48.h),
                            padding: const EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Color(0xffFFFFFF),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.r),
                                topRight: Radius.circular(10.r),
                                bottomLeft: Radius.circular(24.r),
                                bottomRight: Radius.circular(24.r),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'love yourself before loving others',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        30.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox.shrink(),
                            IconButton(
                              onPressed: () {
                                // print('button Pressed');
                                // Navigator.pop(context);
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.5),
                                fixedSize: Size(60.w, 48.h),
                                padding: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color(0xff8A2387),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24.r),
                                    topRight: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(24.r),
                                    bottomRight: Radius.circular(24.r),
                                  ),
                                ),
                              ),
                              icon: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15.sp,
                                    color: const Color(0xffE94057),
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const  Icon(Icons.report)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );

          /*    */
        },
      ),
    );
  }
}
