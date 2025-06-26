class ProfileDetailsData {
  const ProfileDetailsData({
    required this.currentTitle,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.location,
  });

  final List<String> currentTitle;
  final String email;
  final String phone;
  final String birthday;
  final String location;
}
