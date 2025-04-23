// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details_vertical.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

const kFirstIndex = 0;

class Details extends HookWidget {
  const Details({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(
      initialLength: 5,
      initialIndex: kFirstIndex,
    );
    final index = useState(kFirstIndex);

    if (context.isSmallScreen) {
      dev.log('Small screen', name: 'Details');
    }

    return context.isSmallScreen
        ? const DetailsVertical(initialIndex: kFirstIndex)
        : Expanded(
            child: DefaultTabController(
              length: 5,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Card(
                    child: Container(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width - 300,
                        maxHeight: MediaQuery.sizeOf(context).height - 150,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: allPadding24,
                        child: Builder(
                          builder: (context) {
                            final index = controller.index;

                            return switch (index) {
                              0 => const AboutMe(),
                              1 => const Experiences(),
                              2 => const Projects(),
                              3 => const Skills(),
                              4 => const Educations(),
                              _ => const Text('No data available'),
                            };
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: allPadding4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2C2C2D),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        constraints: context.isSmallScreen
                            ? const BoxConstraints(
                                maxHeight: 50,
                                maxWidth: 250,
                              )
                            : const BoxConstraints(
                                maxHeight: 50,
                                maxWidth: 500,
                              ),
                        child: TabBarHeader(
                          controller: controller,
                          index: index,
                          isScrollable: true,
                          isSmallScreen: context.isSmallScreen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
