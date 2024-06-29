
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .25,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Shimmer.fromColors(
                    direction: ShimmerDirection.ltr,
                    baseColor: const Color.fromARGB(255, 125, 125, 125),
                    highlightColor: const Color.fromARGB(255, 160, 159, 159),
                    child: Container(
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  )),
            ),
          ),
        ));
  }
}
