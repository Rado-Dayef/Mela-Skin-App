class AppStrings {
  /// App.
  static const String appName = "Mela Skin";
  static const String appSlogan = "Early Detection, Better Protection";

  /// Routes.
  static const String homeRoute = "/home";
  static const String signInRoute = "/signIn";
  static const String signUpRoute = "/signUp";
  static const String splashRoute = "/splash";
  static const String detailsRoute = "/details";
  static const String detectWithAiRoute = "/detectWithAi";

  /// Toasts.
  static const String noUserFoundToast = "No user found with that data.";
  static const String pleaseVerifyEmailToast = "Please verify your email First.";
  static const String passwordResetEmailSentToast = "Password reset email sent!, Please check your email.";
  static const String pleaseMakeSureThatYouHaveUploadedAnImageToast = "Please make sure that you have uploaded an image.";
  static const String pleaseMakeSureThatYouHaveUploadedAnImageAndSelectedATimeForThatBookingToast = "Please make sure that you have uploaded an image and selected a time for that booking.";

  /// Validation.
  static const String isRequiredValidation = "is required";
  static const String invalidEmailValidation = "Invalid email";
  static const String invalidPhoneNumberValidation = "Invalid Phone Number";
  static const String lessThen4Validation = "Can't be less then 4 characters";
  static const String lessThen8Validation = "Can't be less then 8 characters";
  static const String emailDoesNotContainAtValidation = "Email doesn't contain @";
  static const String largerThen24Validation = "Can't be larger then 24 characters";

  /// Hero Tag
  static const titleTag = "title";
  static const emailTag = "email";
  static const buttonTag = "button";
  static const passwordTag = "password";
  static const doNotHaveTag = "doNotHave";
  static const screenTitleTag = "screenTitle";

  /// Fonts.
  static const String timesFont = "Times";

  /// Formats.
  static const String dateFormat = 'EEEE - dd/MM/yyyy - hh:mma';

  /// Firebase Collection, Field.
  static const String toField = "to";
  static const String dayField = "day";
  static const String roleField = "role";
  static const String timeField = "time";
  static const String nameField = "name";
  static const String fromField = "from";
  static const String dateField = "date";
  static const String emailField = "email";
  static const String usersCollection = "users";
  static const String patientsField = "patients";
  static const String schedulesField = "schedules";
  static const String isAcceptedField = "isAccepted";
  static const String phoneNumberField = "phoneNumber";

  /// Signs.
  static const String atSign = "@";
  static const String orSign = "|";
  static const String andSign = "&";
  static const String emptySign = "";
  static const String plusSign = "+";
  static const String bangSign = "!";
  static const String hashSign = "#";
  static const String commaSign = ",";
  static const String caretSign = "^";
  static const String colonSign = ":";
  static const String spaceSign = " ";
  static const String periodSign = ".";
  static const String hyphenSign = "-";
  static const String plusTwoSign = "+2";
  static const String asteriskSign = "*";
  static const String questionSign = "?";
  static const String newLineSign = "\n";
  static const String backSlashSign = "/";
  static const String emoticonSign = ":-";
  static const String percentageSign = "%";
  static const String underscoreSign = "_";
  static const String twoSpacesSign = "  ";
  static const String emoticonVSign = "-:";
  static const String commaSpaceSign = ", ";
  static const String ellipsisSign = ".....";
  static const String openParenthesisSign = "(";
  static const String closeParenthesisSign = ")";
  static const String closingCurlyBraceSign = "}";
  static const String openingCurlyBraceSign = "{";
  static const String closingSquareBracketSign = "]";
  static const String openingSquareBracketSign = "[";

  /// Base URLs
  static const String imagesBase = "assets/images";
  static const String aiModel = "assets/model.tflite";

  /// Assets
  static const String doctorDarkIcon = "$imagesBase/doctorDarkIcon.png";
  static const String patientDarkIcon = "$imagesBase/patientDarkIcon.png";
  static const String doctorLightIcon = "$imagesBase/doctorLightIcon.png";
  static const String patientLightIcon = "$imagesBase/patientLightIcon.png";

  /// Text.
  static const String toText = "To";
  static const String telText = "tel";
  static const String dayText = "Day";
  static const String fromText = "From";
  static const String sendText = "Send";
  static const String roleText = "Role";
  static const String emailText = "Email";
  static const String cancelText = "Cancel";
  static const String detectText = "Detect";
  static const String acceptText = "Accept";
  static const String doctorText = "Doctor";
  static const String signInText = "Sign In";
  static const String signUpText = "Sign Up";
  static const String patientText = "Patient";
  static const String searchText = "Search...";
  static const String passwordText = "Password";
  static const String scheduleText = "Schedule";
  static const String bookedAtText = "Booked at";
  static const String userNameText = "User Name";
  static const String uploadImageText = "Upload Image";
  static const String phoneNumberText = "Phone Number";
  static const String addScheduleText = "Add Schedule";
  static const String dumPhoneNumberText = "01012345678";
  static const String detectWithAIText = "Detect with AI";
  static const String forgotPasswordText = "Forgot Password";
  static const String noSchedulesYetText = "No Schedules Yet";
  static const String noDoctorsFoundText = "No Doctors Found";
  static const String noPatientsFoundText = "No Patients Found";
  static const String yourBookingTimeText = "Your booking time";
  static const String doNotHaveAnAccountText = "Don't have an account";
  static const String alreadyHaveAnAccountText = "Already have an account";
  static const String thisDoctorAcceptedYourCaseText = "This doctor accepted you case";
  static const String doYouWantToCancelThisPatientText = "Do you want to cancel this patient?";
  static const String sorryThisDoctorDidNotAcceptedYourCaseText = "Sorry, This doctor didn't accepted you case";
  static const String youHaveAlreadyAcceptedThisCaseText = "You have already accepted this case, Do you want to cancel it?";
  static const String youHaveAlreadyCanceledThisCaseText = "You have already canceled this case, Do you want to accept it?";
  static const String youHaveAlreadySentYourDetailsText = "You have already shared your case with this doctor, Do you want to cancel it?";

  /// Ai Classes
  static const String melanomaText = "Melanoma";
  static const String benignText = "Benign";
}
