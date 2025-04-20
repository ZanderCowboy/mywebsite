// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mywebsite/util/ui_constants.dart';

class Details extends HookWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Body());
  }
}

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 5);
    final index = useState(0);

    return DefaultTabController(
      length: 5,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Card(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.sizeOf(context).width - 300,
                  maxHeight: MediaQuery.sizeOf(context).height - 150,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF1E1E1F),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: allPadding24,
                  child: Builder(
                    builder: (context) {
                      final index = controller.index;

                      return switch (index) {
                        0 => AboutMe(),
                        1 => Experience(),
                        2 => Education(),
                        3 => Skills(),
                        4 => Projects(),
                        _ => Container(
                            child: Text('No data available'),
                          ),
                      };
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: allPadding4, // this is for the card
                  decoration: BoxDecoration(
                    color: Color(0xFF2C2C2D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 50,
                    maxWidth: 650,
                  ),
                  child: TabBarHeader(controller: controller, index: index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.purple,
            blurRadius: 4,
            offset: Offset(-1, -1),
            blurStyle: BlurStyle.solid,
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.30),
            blurRadius: 4,
            offset: Offset(-1, -1),
            blurStyle: BlurStyle.outer,
          ),
        ],
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({
    required this.controller,
    required this.index,
    super.key,
  });

  final TabController controller;
  final ValueNotifier<int> index;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // isScrollable: true,
      onTap: (value) {
        index.value = value;
      },
      dividerColor: Colors.transparent,
      controller: controller,
      tabs: [
        Tab(text: 'About Me'),
        Tab(text: 'Experience'),
        Tab(text: 'Education'),
        Tab(text: 'Skills'),
        Tab(text: 'Projects'),
      ],
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.white,
    );
  }
}

class TabBarViews extends StatelessWidget {
  const TabBarViews({
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      viewportFraction: 0.5,
      controller: controller,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Software Engineer at XYZ Company',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer at ABC Company',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // Experience Tab
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Software Engineer at XYZ Company',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer at ABC Company',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        // Education Tab
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Bachelor of Science in Computer Science',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Master of Science in Software Engineering',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Bachelor of Science in Computer Science',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Master of Science in Software Engineering',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Bachelor of Science in Computer Science',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Master of Science in Software Engineering',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About me',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BodyDivider(),
          Text('data'),
          SizedBox(
            height: 150,
            child: Text(
              'Title 0 0 0 dfdfd d dfdfdf dfd dfd dfdfd dfd',
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3,
            padding: allPadding4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              GridItem(title: 'Item 1'),
              GridItem(title: 'Item 2'),
              GridItem(title: 'Item 3'),
              GridItem(title: 'Item 4'),
            ],
          ),
        ],
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BodyDivider(),
          Text('data'),
        ],
      ),
    );
  }
}

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BodyDivider(),
          Text('data'),
        ],
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BodyDivider(),
          Text('data'),
        ],
      ),
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          BodyDivider(),
          Text('data'),
        ],
      ),
    );
  }
}

class BodyDivider extends StatelessWidget {
  const BodyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Divider(
        thickness: 4,
        indent: 0,
        endIndent: 0,
        height: 24,
        color: Colors.purple,
      ),
    );
  }
}
