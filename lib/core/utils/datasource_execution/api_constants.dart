class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  static const String baseUrl = 'https://fitness.elevateegy.com/api/v1/';
  static const String mealsBaseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  // Auth Routes
  static const String signIn = 'auth/signin';
  static const String signUp = 'auth/signup';
  static const String logout = 'auth/logout';
  static const String changePassword = 'auth/change-password';
  static const String uploadProfilePhoto = 'auth/upload-photo';
  static const String getLoggedUserData = 'auth/profile-data';
  static const String forgotPassword = 'auth/forgotPassword';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';
  static const String deleteAccount = 'auth/deleteMe';
  static const String editProfile = 'auth/editProfile';

  // Level Routes
  static const String getAllDifficultyLevels = 'levels';
  static const String getAllLevelsByPrimeMover =
      'levels/difficulty-levels/by-prime-mover';

  // Muscle Routes
  static const String getAllMuscles = 'muscles';
  static const String get20RandomPrimeMoverMuscles = 'muscles/random';
  static const String getAllPrimeMoverMusclesByMuscleGroupId =
      'musclesGroup/by-muscle-group';

  // Meal Routes
  static const String getAllMealCategories = 'categories.php';
  static const String getMealsByCategory = 'filter.php';
  static const String getMealDetailsById = 'lookup.php';

  // Exercise Routes
  static const String getAllExercises = 'exercises';
  static const String getAllExercisesByMuscleDifficulty =
      'exercises/by-muscle-difficulty';
}
