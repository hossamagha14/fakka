import 'package:fakka/View/Reusable/colors_paddings.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkelatonScreen extends StatelessWidget {
  const SkelatonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
              child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, width: 40, height: 40))),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
              child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.circle, width: 40, height: 40)))
        ],
      ),
      body: Padding(
          padding: horizontalPadding(context, top: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: MediaQuery.of(context).size.width * 0.35),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60)),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonParagraph(
                          style: SkeletonParagraphStyle(
                              lines: 1,
                              lineStyle: SkeletonLineStyle(
                                width: 60,
                                height: 10,
                                borderRadius: BorderRadius.circular(8),
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text(
                  'Payment history',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Row(
                            children: [
                              const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      shape: BoxShape.circle,
                                      width: 60,
                                      height: 60)),
                              const SizedBox(
                                width: 10,
                              ),
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 2,
                                    lineStyle: SkeletonLineStyle(
                                      width: 70,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                    )),
                              ),
                              const Spacer(),
                              const SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      width: 60, height: 30))
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 30,
                        ),
                    itemCount: 3),
              )
            ],
          )),
    );
  }
}
