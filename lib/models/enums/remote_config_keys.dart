enum RemoteConfigKeys {
  aboutMe('about_me'),
  education('education'),
  experience('experience'),
  profileDetails('profile_details'),
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

enum RemoteConfigFeatureFlags {
  /// Toggles quote on About Me section
  aboutMeShowQuote('about_me_show_quote'),

  /// Toggles newspaper layout on About Me section
  aboutMeUseSplit('about_me_use_split'),

  /// Toggles split on Education section to use Formal/Accreditation view
  educationUseSplit('education_use_split'),

  /// Toggles to use paragraphs on Experience section instead of bullet points
  experienceUseParagraphs('experience_use_paragraphs'),

  /// Toggles to use the new scroll-to-proceed layout
  useV2Layout('use_v2_layout');

  const RemoteConfigFeatureFlags(this.key);

  final String key;
}
