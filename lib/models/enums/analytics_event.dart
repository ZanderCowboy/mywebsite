/// Enum containing all analytics events that can be logged in the app
enum AnalyticsEvent {
  // Page View Events
  homePageView('home_page_view'),
  personalPageView('personal_page_view'),
  personalSectionView('personal_section_view'),
  personalTabChange('personal_tab_change'),

  // Navigation Events
  navigateToPersonal('navigate_to_personal'),
  navigateToHome('navigate_to_home'),

  // Social Media and Contact Events
  socialMediaClick('social_media_click'),
  emailClick('email_click'),
  phoneClick('phone_click'),

  // Project and Portfolio Events
  projectClick('project_click'),
  cvDownload('cv_download'),
  projectDetailView('project_detail_view'),

  // Skills and Experience Events
  skillClick('skill_click'),
  experienceView('experience_view'),
  educationView('education_view'),
  educationLinkClick('education_link_click'),

  // UI Interaction Events
  avatarClick('avatar_click'),
  search('search'),
  share('share'),

  // Technical Events
  appVersion('app_version'),
  errorOccurred('error_occurred'),
  performanceMetric('performance_metric'),

  // App Lifecycle Events
  firstVisit('first_visit'),
  appOpened('app_opened'),

  // Engagement Events
  sessionDuration('session_duration'),
  pageScrollComplete('page_scroll_complete'),
  userEngagement('user_engagement'),

  // Generic Events
  externalLinkClick('external_link_click');

  const AnalyticsEvent(this.eventName);

  /// The Firebase Analytics event name
  final String eventName;
}
