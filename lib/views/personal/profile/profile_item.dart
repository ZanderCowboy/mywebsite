import 'package:flutter/material.dart';
import 'package:mywebsite/models/enums/profile_item_type.dart';
import 'package:mywebsite/util/export.dart';

part 'utils/_handle_tap.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    required this.type,
    this.remoteData,
    this.onTap,
    super.key,
  });

  final ProfileItemType type;
  final String? remoteData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(type),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: allPadding8,
          decoration: BoxDecoration(
            borderRadius: borderRadius12,
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: borderRadius12,
                ),
                child: Icon(
                  type.icon,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              gap18,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type.header,
                      style: Typo.profileTitle,
                    ),
                    Text(
                      remoteData ?? type.description,
                      style: Typo.profileSubtitle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
