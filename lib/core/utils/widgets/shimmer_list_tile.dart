
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListTile extends StatelessWidget {
  
  const ShimmerListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: const Color.fromARGB(255, 125, 125, 125),
                  highlightColor: const Color.fromARGB(255, 160, 159, 159),
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                            aspectRatio: 2 / 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                color: Colors.white,
                                width: 100,
                                height: 100,
                              ),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                color: Colors.white,
                                height: 60,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(15),
                                    child: Container(
                                      color: Colors.white,
                                      height: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(15),
                                    child: Container(
                                      color: Colors.white,
                                      height: 35,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              )
    );
  }
}
