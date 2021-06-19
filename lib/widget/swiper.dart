import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid/controller/swiper_controller.dart';
import 'package:wanandroid/widget/keep_alive_manager.dart';

enum IndicatorType { circle, point }

class Swiper extends GetView<SwiperController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          physics: PageScrollPhysics(),
          controller: controller.pageController,
          itemBuilder: (context, index) {
            return KeepAliveManager(
              child: Container(
                height: 150,
                width: double.infinity,
                child: Obx(
                    () => CachedNetworkImage(imageUrl: controller.banners.value![index].imagePath!, fit: BoxFit.cover)),
              ),
            );
          },
          itemCount: controller.banners.value!.length,
        ),
        Positioned(
          bottom: 5,
          child: Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: controller.banners.value!
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.only(
                            left: controller.banners.value!.indexOf(e) == 0 ? 0 : 5,
                            right:
                                controller.banners.value!.indexOf(e) == controller.banners.value!.length - 1 ? 0 : 5),
                        child: CircleAvatar(
                          backgroundColor: controller.animaValue.value == controller.banners.value!.indexOf(e)
                              ? Colors.grey
                              : Colors.white,
                          radius: 3,
                        ),
                      ),
                    )
                    .toList(),
              )),
        )
      ],
    );
  }

  @override
  SwiperController get controller {
    return Get.put(SwiperController());
  }
}
// class Swiper extends StatefulWidget {
//   final bool showIndicator;
//   final Color activeIndicatorColor;
//   final Color passiveIndicatorColor;
//   final IndicatorType indicatorType;
//   final List<MyBanner> banners;
//
//   const Swiper({
//     Key? key,
//     required this.banners,
//     this.showIndicator = true,
//     this.activeIndicatorColor = Colors.grey,
//     this.passiveIndicatorColor = Colors.white,
//     this.indicatorType = IndicatorType.circle,
//   }) : super(key: key);
//
//   @override
//   _SwiperState createState() => _SwiperState();
// }
//
// class _SwiperState extends State<Swiper> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
//   late PageController controller;
//   late AnimationController animationController;
//   late Animation<int> animation;
//
//   @override
//   void initState() {
//     controller = PageController();
//     super.initState();
//     animationController = AnimationController(vsync: this, duration: Duration(seconds: 3 * widget.banners.length));
//     animation = IntTween(begin: 0, end: widget.banners.length - 1).animate(animationController);
//     animation.addListener(() {
//       controller.jumpToPage(animation.value);
//       setState(() {});
//     });
//     animationController.repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         PageView.builder(
//           controller: controller,
//           itemBuilder: (context, index) {
//             return Container(
//               height: 150,
//               width: double.infinity,
//               child: CachedNetworkImage(imageUrl: widget.banners[index].imagePath!, fit: BoxFit.cover),
//             );
//           },
//           itemCount: widget.banners.length,
//         ),
//         Positioned(
//           bottom: 5,
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: widget.banners
//                 .map(
//                   (e) => Padding(
//                     padding: EdgeInsets.only(
//                         left: widget.banners.indexOf(e) == 0 ? 0 : 5,
//                         right: widget.banners.indexOf(e) == widget.banners.length - 1 ? 0 : 5),
//                     child: CircleAvatar(
//                       backgroundColor: animation.value == widget.banners.indexOf(e)
//                           ? widget.activeIndicatorColor
//                           : widget.passiveIndicatorColor,
//                       radius: 3,
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         )
//       ],
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
// }
