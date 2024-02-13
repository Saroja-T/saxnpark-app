class Strings {
  static String appName = "SaxnPark";

  static bool passwordChanged = false;
  static bool accountLocked = false;
  static bool isVehicleDeleted = false;
  static bool isAccountDeleted = false;
  static bool isContactSuccess = false;
  static bool hasOldPassword = false;
  static bool isPermitSuccess = false;
  static bool isMaxVehicle = false;
  static bool isMinVehicle = false;
  static bool isPaymentFailed = false;
  static bool isPermitError = false;

  //Landing page
  static String account = "Account";
  static String home = "Home";
  static String permit = "Permit";
  static String sessions = "Sessions";
  static String locations = "Locations";
  static String homeContent = "Park smart, with Saxnpark";
  static String parkNow = "Park now";
  static String findOut = "Find out more";
  static String ourLocation = "Our Locations";
  static String searchHint = "Search state or city";
  static String locationHint = "Country, city or location number";
  static String nearMe = "Near me";
  static String recent = "Recent";
  static String disabledParking = "Disabled parking";
  static String chargingStation = "Charging station";
  static String cancel = "Cancel";
  static String attention = "Attention";
  static String openSettings = "Open Settings";
  static String registerkNow = "Register now";

  static String alreadyHaveAccount = "Already have an account? ";
  static String signin = "Sign in";
  static String passwordReset = "Password reset";
  static String register = " Register";
  static String login = "Login";
  static String dontHaveAnAccount = "Don't have an account? ";
  static String phoneNumber = "Phone number";
  static String resetPassword = "Reset password";
  static String resetPasswordDescription =
      "Please enter your phone number and we will send instructions on how to reset your password";
  static String resetPasswordDescription1 = 
      "Please enter your phone number and we will send a code to reset your password";
  static String password = "Password";
  static String sendRestLink = "Send reset link";
  static String backtoSignIn = "Back to sign in";
  static String verification = "Verification";
  static String enterVerification = "Enter verification code";
  static String editPhoneNumber = "Edit phone number";
  static String verificationCode = "Verification code";
  static String sendAnother = "Send another code";
  static String iN = " in ";
  static String verifying = "Verifying";
  static String passwordUpdated = "Password successfully updated";
  static String verificationMessage = "We sent a code to ";
  static String verificationMessage1 =
      " please enter it below so we can verify you";
  static String securityAlert = "Security alert: account locked";
  static String securityAlertMsg = "We're sorry, it seems like there have been three unsuccessful attempts to access your account."; 
  static String securityAlertMsg1 = "To ensure the security of your information, your account has been locked."; 
  static String securityAlertMsg2 = "Click on the 'Forgot Password' link below to reset your password securely.";

  static String oldPassword = "Old password";
  static String confirmPassword = "Confirm password";
  static String forgotPassword = "Forgot password?";
  static String registerWith = "or register with";
  static String loginWith = "or continue with";
  static String enterPassword = "Enter password";
  static String termsAndConditionText =
      "By continuing, you are agreeing to our ";
  static String termsAndConditions = "Terms and conditions";
  static String and = " and ";
  static String privacyPolicy = "Privacy policy";
  static String addPhoneNumber = "Add Phone Number";
  static String emailId = "Email : ";
  static String continueBtn = "Continue";
  static String createNewPassword = "Create new password";
  static String enterNewPassword = "Please enter your new password";
  static String phoneNumberNotes =
      "Your mobile number plays a vital role in ensuring a secure and efficient experience. It is used for both account verification and as a means of account recovery when needed.";

  static String passwordError =
      "Must include at least ";
  static String passwordError1 ="8 characters, a capital letter, a number and a special character";
  static String confirmPasswordError = "Passwords don’t match";
  static String numberError = "Phone number should be minimum 10 numbers";
  static String emptyPasswordError = "Password can't be empty";
  static String passwordIncorrect = "Password incorrect";
  static String emptyNumberError = "Phone number incorrect. Please check and re-enter.";
  static String emailError = "Email address incorrect. Please check and re-enter.";
  static String verificationCodeError = "Verification code is invalid";
  static String vehicleDeleted = "Vehicle has been successfully deleted.";

  
  /**  
     * After OTP verification,
     * false - redirect to general home 
     * true - redirect to login
    */
  static bool shouldRedirectToHome = false;

  static String savedText = "Saved";

  //General
  static String createAccount = "Create account";
  static String createAnAccount = "Create an account";
  static String seeParkingLocations = "See parking locations";
  static String letsGet = "Let's get";
  static String started = "Started";

  //Booking
  static String bookingDetails = "Booking details";
  static String bookingConfirmation = "Booking confirmation";
  static String requestConfirmation = "Request confirmation";
  static String bookingConfirmationTitle = "Are these details correct?";
  static String bookingConfirmed = "Your booking is confirmed";
  static String next = "Next";
  static String getDirections = "Get directions";
  static String vehicle = "Vehicle";
  static String duration = "Duration";
  static String location = "Location";
  static String change = "Change";
  static String today = "Today";
  static String minutes = "minutes";
  static String hours = "hours";
  static String days = "days";
  static String cost = "Cost";
  static String paymentMethod = "Payment method";
  static String space = "Space";
  static String confirmAndPay = "Confirm and pay";
  static String setRemainder = "Set a remainder";
  static String gotoSessions = "Go to sessions";
  static String goToBookings = "Go to bookings";

  static String rquestSentMessage = "Your parking request has been sent!";
  static String paymentFailure = "Sorry, your payment has not been processed. Please check payment details and try again.";
  static String signOutConfirmation = "Are you sure you want to sign out?";

  //Payment
  static String methodToPay="How would you like to pay?";
  static String reviewAndPay="Review and pay";


  //redirections
  static String rHome = "home";

  //Location Page
  static String rLocationGridList = "locationGridList";
  static String rLocationList = "locationList";
  static String rLocationSearchList = "locationSearchList";
  static String rLocationListWithoutSelection = "locationListWithoutSelection";
  static String rNearMeList = "nearMeList";
  static String rNearMeMapList = "nearMeMapList";
  static String rRecentList = "recentList";

  //Accounts
  static String rMyLocation = "mylocations";
  static String rMyVehicles = "myVehicles";
  static String rMySettings = "mySettings";
  static String rMyDetails = "myDetails";
  static String rDeleteVehicle = "deleteVehicle";

  // Session
  static String rSession = "session";
  static String rPermit = "permit";
  static String rAccount = "account";

  //Permit
 static String rAddPermit = "addPermit";
 static String rDriversDetails = "driversDetails";
 static String rConfirmedDriversDetails = "confirmedDriversDetails";
 static String rVehicleDetails = "vehicleDetails";
 static String rUpdateDriverDetails = "updateDriverDetails";
 static String filters = "Filters";
 static String date = "Date";
 static String status = "Status";

  // Booking
  static String rPurpose = "purpose";
  static String rVehicleType = "vehicleType";
  static String rPark = "park";
  static String rParkTime = "parkTime";
  static String rBookingConfirmation = "bookingConfirmation";
  static String rBookingDetails = "bookingDetails";
  static String rVisitorBookingDetails = "visitorBookingDetails";
  static String rVisitorBookingConfirmation = "visitorBookingConfirmation";
  static String rVisitorScreen = "visitorScreen";
  static String rFaq = "Faq";
  static String rHelp = "help";
  static String rSessionTransfer = "sessionTransfer";

  static String? identity;

  //Locationlist Title Text
  static String carParkName = "Car park name - 67201";
  static String weekDayText = "Monday - Saturday";
  static String weekEndText = "Sundays";
  static String timeFrequencyText = "For every 5 minutes";
  static String oneHourText = "60 minutes";
  static String oneWeek = "1 week";
  static String oneMonth = "1 month";

  static String twentyFour = "24 hours";
  static String temMinText = "10 minutes";
  static String thirtyMinText = "30 minutes";
  static String extentableText = "Up to maximum stay";
  static String cancellationText = "Up to 15 minutes before";
  static String fiveMinText = "5 minutes";
  static String anyText = "Any";
  static String carParkText = "Car park";

  static String buttonCloseText = "Close";
  static String carParkTitle = "Car park details";
  static String operatorTitle = "Operator";
  static String daysandTimesText = "Days and times";
  static String rates = "Rates";
  static String notesText = "Notes";
  static String policiesText = "Policies";
  static String aboutLocation = "About location";

  static String minimumStay = "Minimum stay";
  static String noReturnwithin = "No return within";
  static String extentable = "Extendable";
  static String minCancellationTime = "Minimum cancellation time";
  static String depGap = "Departure gap";
  static String permittedVehicles = "Permitted vehicles";
  static String locType = "Location type";
  static String parkingCapacity = "Parking capacity";
  static String anyAdditionalInfo = "Any additional info";
  static String emailPhone = "Email / phone number";
  static String contactDetails = "Contact details";

  static String userIdNo = "User ID number";
  static String shareText = "Share";
  static String download = "Download";
  static String myDetails = "My details";
  static String myVehicles = "My vehicles";
  static String myLocation = "My locations";
  static String parkingPermits = "Parking permits";
  static String permitsAndReq = "Permits & requests";
  static String visitRequest= "Visit Request";
  static String hostRequest= "Host Request";
  static String view= "View";
  static String settings = "Settings";
  static String signOut = "Sign out";
  static String deleteAccount = "Delete account";
  static String deleteVehicle = "Delete vehicle";
  static String help = "Help";
  static String back = "Back";
  static String delete = "Delete";

  static String signInToContinue = "Sign in to continue";
  static String saveYourInfo = "Create an account and save your info in a few simple steps for faster parking in the future.";

  static String copiedMsg = "Copied Successfully";
  static String visitPurpose = "What’s the purpose of your visit?";
  static String purposeOfVisit = "Purpose of visit";
  static String visitVehicle = "Which vehicle are you parking?";
  static String parkingTime = "When are you parking?";
  static String justParking = "I’m just parking";
  static String visiting = "I’m visiting";
  static String addVehicle = "Add a new vehicle";
  static String driveInTime = "Drive-in date and time";
  static String driveOutTime = "Drive-out date and time";
  static String todayText = "Today";
  static String tomorrowText = "Tommorrow";
  static String slotUnavailableWarning =
      "No availability for your selected time and date";
  static String viewPrices = "View prices";
  static String visitorTitle = "Who are you visiting?";
  static String dropDownHint = "Select host";
  static String hostText = "Host";
  static String validFrom = "Valid from";
  static String validUntil = "Valid until";
  static String validTo = "Valid to";
  static String parkingSpace = "Parking space";
  static String price = "Price";
  static String parkingFee = "Parking fee";
  static String serviceFee = "Service fee";
  static String total = "Total";
  static String taxes = "Taxes";
  static String maxVehicle = "You can add a maximum of 2 vehicles. To add a new vehicle, please delete one from your account.";
  static String minVehicle = "You must add a vehicle to continue.";

  //Authentication
  static String countryCode = "Country code";
  static String searchCountry = "Search country";
    static String searchState =  "Search State";


  // Driver Account Creation
  static String driverDetails = "Driver details";
  static String driverName = "Driver name";
  static String name = "Name";
  static String details = "Details";
  static String enterDriverName = "Enter full name";
  static String driverLicenseMsg =
      "Please enter as shown on your drivers license.";
  static String numberChangeMsg =
      "This number was used to register your account and can’t be changed.";
  static String emailAddress = "Email address";
  static String enterEmailAddress = "Enter email address";
  static String country = "Country";
  static String selectCountry = "Select country";
  static String state = "State";
  static String selectState = "Select state";
  static String saveAndContinue = "Save and continue";
  static String saveChanges = "Save changes";
  static String vehicleDetails = "Vehicle details";
  static String vehicleNumber = "Vehicle registration number";
  static String searchText = "Search";
  static String vehicleType = "Vehicle type";
  static String vehicleModel = "Vehicle model";
  static String vehicleMake = "Vehicle make";
  static String vehicleNick = "Vehicle nickname";
  static String selectVehicleMake = "Select vehicle make";
  static String selectVehicleModel = "Selct vehicle model";
  static String selectVehicleType = "Select vehicle type";
  static String selectHost = "Select host";
  static String saveAndPark = "Save and park";
  static String enterManually = "Enter manually";
  static String enterManuallyMsg = "Sorry, we can’t find your vehicle. Please search again or enter manually.";
  static String vehicleTypeMsg = "We couldn’t find your vehicle type";
  static String searchVehicleType = "Search vehicle type";
  static String searchVehicleMake = "Search vehicle make";
  static String searchVehicleModel = "Search vehicle model";
  static String searchHost = "Search host name";
  static String title = "Title";
  static String enterVehicleType = "Enter vehicle type";
  static String enterVehicleNumber = "Enter vehicle number";
  static String enterVehicleMake = "Enter vehicle make";
  static String enterVehicleModel = "Enter vehicle model";
  static String enterVehicleNick = "Enter vehicle nick name";
  //Error message
  static String errorName = "Name cannot be empty.";
  static String errorNameLength = "Name length should be at least 3 characters and not exceed 70 characters.";
  static String errorCountry = "Please choose a country before proceeding.";
  static String errorState = "State selection is required.";
  static String errorVehicleNumber = "Please provide a valid vehicle number.";
  static String errorVehicleType = "We couldn’t find your vehicle type";
  static String errorVehicleMake = "Vehicle make is required. Please choose one.";
  static String errorVehicleModel = "Oops! It looks like you forgot to select a vehicle model.";
  static String errorVehicleType1 = "We couldn’t find your vehicle type";
  static String errorVehicleMake1 = "Vehicle make is required."; 
  static String errorVehicleModel1 = "Oops! It looks like you forgot to add a vehicle model.";



// Help
  static String faq = "FAQs";
  static String cancellationPolicy = "Cancellation policy";
  static String contactUs = "Contact us";
  static String helpfulArticles = "Most helpful articles";
  static String allTopics = "All topics";
  static String topic = "Topic";
  static String findInfo = "Find information";


// Sessions
  static String activeSessions = "Active sessions";
  static String pastSessions = "Past sessions";
  static String confirmed = "Confirmed";
  static String complete = "Complete";
  static String approved = "Approved";
  static String pending = "Pending";
  static String noActiveSessions = "You have no active sessions";
  static String noPastSessions = "You have no past sessions";
  static String parkAgain = "Park again";
  static String getReceipt = "Get receipt";
  static String cancelBooking = "Cancel booking";
  static String reasonForCancellation = "Reason for cancellation";
  static String sessionDetails = "Session details";
  static String amountPaid = "Amount paid";
  static String viewMore = "View more";
  static String timeLeft = "Time left";
  static String transferSession = "Transfer session";
  static String extendSession = "Extend session";
  static String dontWorry = "Don’t worry, you have a 5 minute grace period";
  static String viewDetails = "View details";
  static String submitChanges = "Submit changes";
  static String sessionTransfer = "Session transfer";
  static String enterUserIdNo = "Enter User ID number";
  static String userIdNotFound = "The User ID number you entered cannot be found";
  static String sessionTransferred = "Session successfully transferred";
  static String sessionTransferMsg = "You are transferring the remaining time on your permit to another Saxnpark user.";
  static String sendingParking = "User 8176392 is sending you their parking session at Heathrow Airport - Terminal 1.";
  static String updateDriverDetailsMsg = "Your details have been submitted. We will notify you when your request has been approved.";
  static String permitError = "There is an error with your permit, please contact the code issuer.";

//Permits
  static String permits = "Permits";
  static String activePermits = "Active permits";
  static String noActivePermits = "You have no parking permits";
  static String expiredPermits = "Expired permits";
  static String expires = "Expires";
  static String expired = "Expired";
  static String active = "Active";
  static String past = "Past";
  static String addPermit = "Add parking permit";
  static String permitAccount = "You are about to add a aprking permit";
  static String permitAccount1 = "to your account";
  static String finishedPermit = "When you’ve finished you will be able to find";
  static String finishedPermit1 = "your permits in the permit tab of the app.";
  static String companyCode = "Company code";
  static String enterCompanyCode = "Enter company code";
  static String companyCodeDes = "You should have received a code from your employer to add your parking permit to your Saxnpark account.";
  static String driversDetails = "Driver's details";
  static String companyCodeNotEntered = "The Company code number you entered cannot be found";
  static String theseRCorrect = "Yes, these are correct";
  static String driversName = "Driver's name";
  static String contactNumber = "Contact number";
  static String vehicleRegistration = "Vehicle registration number";
  static String confirm = "Confirm";
  static String noMakeChanges = "No, I need to make changes";
  static String parkingPermit = "Parking Permit";
  static String parkingRequest = "Parking Request";
  static String activate = "Activate";
  static String pendingActivation = "Pending activation";
  static String rejected = "Rejected";
  static String reject = "Reject";
  static String accept = "Accept";
  static String send = "Send";
  static String reasonForRejection = "Reason for rejection";
  static String yourParking = "Your parking request has been approved.";
  static String requestRejected = "Sorry, your parking request has been rejected.";
  static String noParking = "Sorry, there is no parking available at your selected time. Please choose another time/date.";


//Dummy Text
  static String dummyText = "Saxnpark for carpark owners";
  static String dummyText1 = "204 locations";
  static String dummyText2 = "40 cities";
  static String northAmerica = "North America";
  static String newYork = "New York";
  static String countryCount = "204 locations";
  static String us = "United States";
  static String canada = "Canada";
  static String locationDetailTitle = "Heathrow Airport - Terminal 1";
  static String locationDetailAddress = "Hounslow, TW6 1EW, United Kingdom";
  static String operatorText = "Heathrow Airport";
  static String notes = "notes";
  static String incorrectSearchText = "Showing all results for “New York\"";
  static String dummyId = "623478345";
  static String requestParking = "Request parking";
  static String example = "e.g. LJ66 XOS";
  static String example1 = "e.g. Lilo (optional)";
  static String notificationMessage =
      "We will notify you when your booking has been confirmed.";
  static String dummyvehicle1 = "Lilo";
  static String dummyvehicle2 = "Enzo";
  static String dummyCategory1 = "LJ64 XOS";
  static String dummyCategoey2 = "HA66 LNP";
  static String dummySpace1 = "Level 1, B2";
  static String dummyBookingLocation = "Heathrow Airport - Terminal 1";
  static String dummyBookingLocation2 = "Heathrow Airport";
  static String dummyBookingLocation1 = "Hounslow, TW6 1EW, United Kingdom";
  static String dummyTime = "16:00";
  static String dummyPurpose = "Interview";
  static String dummyTime1 = "17:00";
  static String dummyDate = "08/03/2023";
  static String dummyDate1 = "09/03/2023";
  static String dummyDuration = "60";
  static String dummyCost = "\$1.20";
  static String dummySpace = "2B, Level 2, Aisle 6";
  static String dummyPaymentMethod = "ending 3544";
  static String dummyTimeLeft = "58m 01s";
  static String dummyDriversName = "Shaun Johnson";
  static String dummyContactNumber = "056 865 7949";
  static String dummyVehicleMake = "Ford";
  static String dummyVehicleModel = "Fiesta";
  static String dummyVehicle = "Car";
  static String dummyPrice = "\$.60";

  static String dummyBookingMsg =
      "Your space is 2B, Level 2, Aisle 6 at Heathrow Airport - Terminal 1";
  static String locationEnableMessage =
      "Kindly enable location to get information about your nearby parking spaces";

  // Contact Us

  static String submit = "Submit";
  static String errorSubject = "Subject is mandatory";
  static String errorMessage = "Message is mandatory";
  static String subject = "Subject (required)";
  static String message = "Message (required)";
  static String attachment = "Attachment";
  static String selectFile = "Select file";
  static String attachmentHint = "Upload a jpeg, png, pdf no larger than 100 MB";


  // Messages
  static String deleteAccountConfirmationMsg = "Are you sure you want to delete your account?";
  static String accountDeleted = "Your account has been successfully deleted. To start using Saxnpark again you’ll need to create a new account.";
  static String contactUsSuccess = "Thank you for contacting Saxnpark, we will get back to you shortly.";
  static String permitSuccess = "Your permit has been added to your account.";

  



}
