enum RemoteConfigKeys {
  profileDetails('profile_details'),
  aboutMe('about_me'),
  experience('experience'),
  education('education'),
  projects('projects'),
  skills('skills'),
  ;

  const RemoteConfigKeys(this.key);

  final String key;
}

enum RemoteConfigImages {
  backgroundImage('image_background'),
  profileImage('image_profile'),
  ;

  const RemoteConfigImages(this.imageName);

  final String imageName;
}
