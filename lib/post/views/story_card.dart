import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_work/post/providers/stories_provider.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({required this.story, super.key});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 203.h,
      width: 163.w,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 3,
            right: 3,
            child: Container(
              // height: 200.h,
              // width: 159.w,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(15.r),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(story.userAvatar ?? ''),),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Icon(Icons.image_sharp , color: Colors.grey[350],),
                    ),
                  ),
                  Container(
                    height: 55.h,
                    // width: 159.w,             
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                       ),
               
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const  Color(0xffFFFFFF).withOpacity(0),
                          const  Color(0XFF000000)
                        ],),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(story.userName ?? '',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15.sp,
                                color: Color(0xffE94057),),
                               Text('2',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
     
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 18.h,
              width: 18.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: Colors.white
                ),
                color: const Color(0xffE94057),
              ),
            ) 
            ,),
        ],
      ),
    );
  }
}

