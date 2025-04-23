import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/project.dart';
import 'package:mywebsite/util/export.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor,
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: InkWell(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(project.repoLink))) {
            await launchUrl(Uri.parse(project.repoLink));
          }
        },
        child: Container(
          padding: allPadding10,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (project.imageUrl != null)
                FutureBuilder(
                  future: _getImage(project.imageUrl!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Container(
                      height: 200,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: snapshot.hasData
                              ? snapshot.data!
                              : AssetImage(
                                  Assets.images.placeholder.path,
                                ),
                          fit: BoxFit.cover,
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
              const SizedBox(height: 12),
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
              const SizedBox(height: 16),
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

  Future<ImageProvider> _getImage(String imageUrl) async {
    if (project.isNetworkImage) {
      return NetworkImage(imageUrl);
    } else {
      return AssetImage(imageUrl);
    }
  }
}
