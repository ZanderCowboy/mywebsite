import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/domain/project.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/util/image_loader.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    this.expandDescription = false,
    super.key,
  });

  final Project project;
  final bool expandDescription;

  void _handleProjectClick() {
    launchURL(
      project.repoLink,
      analyticsParams: Parameters(
        url: project.repoLink,
        section: 'personal_page',
        tabName: 'Projects',
        itemType: 'project_card',
        itemName: project.name,
        linkType: 'project',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      elevation: 4,
      margin: vertical16,
      child: InkWell(
        onTap: _handleProjectClick,
        child: Container(
          padding: allPadding10,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (project.imageUrl != null)
                FutureBuilder<Widget>(
                  future: Future.value(
                    loadImageWidget(
                      width: double.infinity,
                      imageUrl: project.imageUrl!,
                      isNetworkImage: project.isNetworkImage,
                      borderRadius: borderRadius8,
                    ),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: 200,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius8,
                          color: Colors.grey[200],
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: borderRadius8,
                      ),
                      child: ClipRRect(
                        borderRadius: borderRadius8,
                        child: snapshot.hasData
                            ? snapshot.data!
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius8,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Assets.images.placeholder.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              gap12,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.tools
                    .map(
                      (tool) => Chip(
                        label: Text(
                          tool,
                          style: const TextStyle(
                            color: kBackgroundColor,
                          ),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                    )
                    .toList(),
              ),
              gap16,
              if (expandDescription)
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      project.description,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                )
              else
                Text(
                  project.description,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
