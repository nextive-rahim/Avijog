class API {
  static const String prod = 'https://prod.etestpaper.net/api/';
  static const String dev = 'https://prod.etestpaper.net/api/';

  static const base = dev;

  /// Authentication
  static const user = 'auth/me';
  static const verifyUser = 'v3/auth/exists';
  static const login = 'login';
  static const otpVerification = 'auth/signup/otp';
  static const signUp = 'auth/signup';
  static const forgetPassword = 'auth/forget';
  static const resetPassword = 'password-reset'; //TODO: Need to check
  static const refreshToken = 'auth/refresh';
  static const signOut = 'auth/signout';

  /// Home Section
  static const home = "home";
  static const vendors = "vendor";
  static const balance = "auth/balance";
  static const banners = "utilities/banners";

  /// products
  static const products = "product";
  static const contents = "content/";
  static const verifyCustomer = "payment/exists";
  static const initiatePayment = "payment/init/";

  /// ClassRoom
  static const myProducts = "my-product";
  static const liveEvents = "todays-event";

  /// Notice
  static const notice = "notices?search=";
  static const noticedetails = "notices/";

  /// Utilities
  static const privacyPolicy = "utilities/privacy-policy";
  static const faqs = "utilities/faqs";
  static const userGuide = "utilities/user-guide";
  static const pinChange = 'auth/reset';
  static const updateProfile = 'auth/update';

  /// Notification
  static const notification = 'notifications?type=';

  /// Payment History
  static const paymnetHistory = 'payment/history';
}
