// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "home": {
    "goodMorning": "صباح الخير",
    "searchingTextField": "ابحث عن.......",
    "bestSellerHomeHeader": "الأكثر مبيعًا",
    "bestSellerHomeAppBar": "الأكثر مبيعًا",
    "more": "المزيد",
    "homeNavBar": "الرئيسية",
    "searchPageAppBar": "البحث",
    "notificationsPageAppBar": "الاشعارات",
    "productsPageAppBar": "المنتجات",
    "results": "نتائج",
    "productsNavBar": "المنتجات",
    "sortBy": "ترتيب حسب :",
    "sortByPriceFromLowToHigh": "السعر ( الأقل الي الأعلي )",
    "sortByPriceFromHighToLow": "السعر ( الأعلي الي الأقل )",
    "sortByAlphabetical": "الأبجديه",
    "sort": "تصفيه",
    "cartPageAppBar": "السلة",
    "cartHeaderTagWhenYouHaveProducts": "لديك منتجات في سلة التسوق",
    "cartHeaderTagWhenYouDontHaveProducts": "لا توجد منتجات في سلة التسوق",
    "cartCheckOutButton": "الدفع  جنيه مصري",
    "cartNavBar": "سلة التسوق",
    "egypyPound": "جنيه",
    "amount": "الكيلو",
    "eidOffers": "عروض العيد",
    "discountPercentage": "خصم 25%",
    "bannerButtom": "تسوق الأن"
  },
  "onBoarding": {
    "hello": "مرحبًا بك في ",
    "description1": "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
    "shopping": "ابحث وتسوق",
    "description2": "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
    "startNow": "ابدأ الان",
    "skipNow": "تخط"
  },
  "auth": {
    "loginPage": {
      "loginPageAppBar": "تسجيل الدخول",
      "emailTextField": "البريد الإلكتروني",
      "passwordTextField": "كلمة المرور",
      "forgetPassword": "نسيت كلمة المرور؟",
      "loginButton": "تسجيل الدخول",
      "doNotHaveAnAccount": "لا تمتلك حساب؟",
      "createNewAccount": "قم بإنشاء حساب",
      "orLoginDivider": "أو",
      "signInWithGoogleButton": "تسجيل بواسطة جوجل",
      "signInWithAppleButton": "تسجيل بواسطة أبل",
      "signInWithFacebookButton": "تسجيل بواسطة فيسبوك"
    },
    "signUp": {
      "signUpPageAppBar": "حساب جديد",
      "nameTextField": "الاسم كامل",
      "emailTextField": "البريد الإلكتروني",
      "passwordTextField": "كلمة المرور",
      "termsAndConditions1": "من خلال إنشاء حساب ، فإنك توافق على",
      "termsAndConditions2": "الشروط والأحكام الخاصة بنا",
      "signUpButton": "إنشاء حساب جديد",
      "haveAnAccount": "تمتلك حساب بالفعل؟",
      "signIn": "تسجيل دخول"
    },
    "forgetPassword": {
      "forgetPasswordPageAppBar": "نسيان كلمة المرور",
      "forgetPasswordCondition": "لا تقلق ، ما عليك سوى كتابة رقم الإيميل وسنرسل رمز التحقق.",
      "emailTextField": "البريد الإلكتروني",
      "forgetPasswordButton": "نسيت كلمة المرور"
    },
    "resetYourPassword": {
      "resetYourPasswordPageAppBar": "كلمة مرور جديدة",
      "resetYourPasswordCondition": "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
      "resetYourPasswordTextFieldNewPass": "كلمة المرور الجديدة",
      "resetYourPasswordTextFieldConfirmNewPass": "تأكيد كلمة المرور",
      "resetYourPasswordButton": "إنشاء كلمة مرور جديدة",
      "resetYourPasswordDialog": "تم تغيير الباسورد بنجاح"
    }
  },
  "checkOut": {
    "shippingStep": "الشحن",
    "cashOnDelivery": "الدفع عند الاستلام",
    "DeliveryFromLocation": "التسليم من المكان",
    "buyNowPayLater": "اشتري الان وادفع لاحقا",
    "yourPaymentMethod": "يرجي تحديد طريقه الدفع",
    "addressStep": "العنوان",
    "addressNameTextField": "الإسم بالكامل",
    "addressEmailTextField": "البريد الإلكتروني",
    "addressDetailsTextField": "العنوان",
    "addressCity": "المدينه",
    "addressFloorNum": "رقم الطابق , رقم الشقه ..",
    "saveAddressSwitch": "حفظ العنوان",
    "yourNumberTextField": "رقم الهاتف",
    "paymentOptionMainText": "أختار طريقه الدفع المناسبه :",
    "paymentCardHolderNameTextField": "اسم حامل البطاقه",
    "paymentCardNumberTextField": "رقم البطاقة",
    "paymentCardExpirationDate": "تاريخ الصلاحيه",
    "paymentCardCVVNumber": "CVV",
    "paymentSaveSwitch": "جعل البطاقة افتراضية",
    "orderSummarySection": "ملخص الطلب :",
    "orderSummarySectionSubtotal": "المجموع الفرعي :",
    "orderSummarySectionDelivery": "التوصيل  :",
    "orderSummarySectionTotal": "الكلي",
    "confirmationOrder": "يرجي تأكيد  طلبك",
    "paymentMethod": "وسيلة الدفع",
    "paymentMethodEditButton": "تعديل",
    "shippingAddress": "عنوان التوصيل",
    "shippingAddressEditButton": "تعديل",
    "paymentStep": "الدفع",
    "reviewPageAppBar": "المراجعة",
    "reviewOrderNumber": "رقم الطلب",
    "reviewStep": "المراجعة",
    "shippingStepButton": "التالي",
    "addressStepButton": "العنوان",
    "paymentStepButton": "تأكيد & استمرار",
    "reviewStepButton": "تأكيد الطلب",
    "trackOrederButton": "تتبع الطلب",
    "trackOrderConfirmationText": "تم بنجاح !",
    "reviewGoToMainButton": "الرئيسية",
    "trackOrderPageAppBar": "تتبع الطلب",
    "trackOrderPageOrderNumber": "طلب رقم:",
    "trackOrderPageOrderedAt": "تم الطلب :",
    "trackOrderPageNumberOfItems": "عدد الطلبات : ",
    "trackOrderPageTrackOrderStatus": "تتبع الطلب",
    "trackOrderPageAcceptOrderStatus": "قبول الطلب",
    "trackOrderPageShippedOrderStatus": "تم شحن الطلب",
    "trackOrderPageOutOfDeliveryOrderStatus": "خرج للتوصيل",
    "trackOrderPageDeliverdOrderStatus": "تم تسليم"
  },
  "profile": {
    "profileNavBar": "حسابي",
    "profilePageAppBar": "حسابي",
    "profilePageHeader": "عام",
    "profileSection": "الملف الشخصي",
    "myOrdersSection": "طلباتي",
    "myPaymentsSection": "المدفوعات",
    "myFavoriteSection": "المفضلة",
    "myNotificationsSection": "الإشعارات",
    "myLanguageSection": "اللغة",
    "currentSection": "الوضع",
    "profileFooterText": "المساعدة",
    "whoAreSection": "من نحن",
    "signOutSection": "تسجيل الخروج",
    "userProfileSectionPageAppBar": "الملف الشخصي",
    "userProfilePagePersonalInfoHeader": "المعلومات الشخصية",
    "userProfilePageChangePasswordHeader": "تغيير كلمة المرور",
    "userProfilePageCurrentPasswordTextField": "كلمة المرور الحالي",
    "userProfilePageNewPassword": "كلمة المرور الجديده",
    "userProfilePageConfirmationNewPassword": "تأكيد كلمة المرور الجديده",
    "userProfilePageButton": "حفظ التغيرات",
    "myOrdersPageAppBar": "طلباتي",
    "myOrdersPageItemOrderNumber": "طلب رقم: ",
    "myOrdersPageOrderdAt": "تم الطلب :",
    "myOrdersPageOrdersNumber": "عدد الطلبات: ",
    "myOrdersPageTrackOrderStatus": "تتبع الطلب",
    "myOrdersPageAcceptOrderStatus": "قبول الطلب",
    "myOrdersPageOrderShippedStatus": "تم شحن الطلب",
    "myOrdersPageOrderOutOfDeliveryStatus": "خرج للتوصيل",
    "myOrdersPageOrderDeliverdStatus": "تم التسليم",
    "myPaymentsPageAppBar": "المدفوعات",
    "myPaymentsPageButton": "أضف وسيلة دفع جديده",
    "addNewPaymentPageAppBar": "إضافة بطاقة جديدة",
    "addNewPaymentPageCardHolderName": "اسم حامل البطاقه",
    "addNewPaymentPageCardNumber": "رقم البطاقة",
    "addNewPaymentPageCardExpireDate": "تاريخ الصلاحية",
    "addNewPaymentPageCardCVV": "CVV",
    "addNewPaymentMakeCardDefault": "جعل البطاقة افتراضية",
    "myFavoritePageAppBar": "المفضلة",
    "whoArePageAppBar": "من نحن",
    "wantToLogOut": "هل ترغب في تسجيل الخروج ؟",
    "okLogOut": "تأكيد",
    "idonot": "لا ارغب"
  },
  "itemDetails": {
    "itemDetailsItemPound": "جنية",
    "itemDetailsItemAmount": "الكيلو",
    "itemDetailsReviewItemButton": "المراجعة",
    "itemDetailsAddToCartButton": "أضف الي السلة",
    "itemDetailsExpirationDate": "الصلاحية",
    "itemDetailsOrganicItem": "اورجانيك",
    "itemDetailsReviewsItem": "Reviews",
    "itemDetailsCaloryBy100GM": "100 جرام",
    "itemDetailsCaloryItem": "كالوري",
    "itemDetailsExpireOneYear": "عام",
    "itemDetailsExpireTwoYear": "عامين",
    "itemDetailsExpireThreeYear": "3 اعوام",
    "itemDetailsExpireFourYear": "4 اعوام"
  },
  "reviewAndRating": {
    "reviewAndRatingPageAppBar": "المراجعة",
    "reviewAndRatingTextField": "اكتب التعليق...",
    "reviewAndRatingReviewsText": "مراجعة",
    "reviewAndRatingSummary": "الملخص",
    "reviewAndRatingRecommendedText": "موصى به",
    "reviewAndRatingAddReviewButton": "اضافة تقيم",
    "reviewAndRatingAddReviewTextField": "اترك تقيما..."
  },
  "databaseErrors": {
    "addDataError": "حدث خطأ أثناء إضافة البيانات، حاول مرة أخرى",
    "getDataError": "تعذر تحميل البيانات، تحقق من الاتصال بالإنترنت",
    "getSingleDataError": "تعذر العثور على البيانات المطلوبة",
    "getNestedDataError": "تعذر تحميل البيانات المرتبطة",
    "getQueryDataError": "حدث خطأ أثناء البحث عن البيانات",
    "removeDataError": "تعذر حذف البيانات",
    "updateDataError": "حدث خطأ ما اثناء تحديث البيانات",
    "getStreamData": "حدث خطأ اثناء جلب البيانات"
  },
  "storageErrors": {
    "addFileError": "فشل تحميل الصورة إلي قاعدة البيانات"
  },
  "authErrors": {
    "generalError": "حدث خطأ ما برجاء المحاولة مرة آخرى",
    "weakPasswordError": "هذا الباسورد ضعيف",
    "emailAlreadyInUseError": "هذا الإيميل مستخدم بالفعل",
    "invalidEmailError": "الايميل او الباسورد غير صحيح برجاء المحاولة مرة آخرى",
    "networkError": "لا يوجد اتصال بالإنترنت",
    "userNotFoundError": "هذا المستخدم غير موجود بالفعل",
    "wrongPasswordError": "الايميل او الباسورد غير صحيح برجاء المحاولة مرة اخرى",
    "invalidCreadintialError": "حدث خطأ ما برجاء المحاولة مرة آخرى"
  },
  "cart": {
    "cartCurrency": "جنية",
    "cartAmount": "كم"
  },
  "loginCubit": {
    "successSignInState": "تم تسجيل الدخول بنجاح",
    "successSignInWithGoogleState": "تم تسجيل الدخول بنجاح بواسطة جوجل",
    "successSignInWithFacebookState": "تم تسجيل الدخول بنجاح بواسطة فيس بوك"
  },
  "sendResetPasswordEmailCubit": {
    "successSendEmailState": "تحقق من البريد الإلكتروني"
  },
  "termsAndConditions": {
    "failureTermsAndConditionsState": "من فضلك وافق على الشروط والأحكام"
  },
  "registerCubit": {
    "successRegisterState": "تم إنشاء حساب جديد"
  },
  "resetPassword": {
    "failureConfirmPasswordState": "تأكيد الباسورد غير صحيح"
  },
  "cartCubit": {
    "cartItemIncremented": "تم زيادة عدد ال",
    "cartItemDecremented": "تم تقليل عدد ال"
  },
  "checkOutSteps": {
    "pleaseSpecifyPaymentMethod": "حدد وسيلة الدفع من فضلك",
    "completeTheInformation": "اكمل البيانات من فضلك",
    "city": "المدينة : ",
    "address": "العنوان :",
    "floorNumber": "رقم الشقة :",
    "successAddOrderState": "تم إضافة الاوردر الخاص بك",
    "loadingAddYourOrderState": "جاري إضافة الأوردر الخاص بك",
    "pleaseCompleteAddressDetails": "من فضلك اكمل تفاصيل التوصيل"
  },
  "itemDetailsStatus": {
    "loadingReviewsForThisItem": "يتم تحميل التقيمات لهذا المنتج",
    "beTheFirstOneToAddReview": "كن اول من يضع تعليقا",
    "nothing": "لا يوجد"
  },
  "time": {
    "morning": "صباحا",
    "night": "مساءا"
  },
  "homeStatus": {
    "loadingYourName": "جاري تحميل الإسم",
    "addProductToFav": "تم إضافة المنتج للمفضلة",
    "removeProductFromFav": "تم إزالة المنتج من المفضلة",
    "addProductToCart": "تم إضافة المنتج بنجاح",
    "loadingAddProductToCart": "جاري اضافة المنتج للعربة",
    "productIncrementedInCart": "زيادة كمية المنتج بنجاح",
    "productDecrementedFromCart": "تم تقليل كمية المنتج"
  },
  "search": {
    "searchResults": "نتائج البحث ",
    "recentSearchResult": "عمليات البحث الأخيرة",
    "deleteAll": "حذف الكل",
    "noSearchResults": "لا توجد نتائج بحث",
    "search": "البحث",
    "EmptySearchResult": "عفوًا... هذه المعلومات غير متوفرة للحظة"
  },
  "products": {
    "loadingProductsState": "جاري تحميل المنتجات",
    "nothingProductsState": "لا يوجد منتجات"
  },
  "profileStatus": {
    "successAddNewCardState": "تم اضافة الكارت بنجاح",
    "successUpdateUserImageState": "تم تغير الصورة بنجاح",
    "editPhotoButton": "تعديل الصورة",
    "loadingYourNameState": "جاري تحميل الإسم",
    "loadingYourEmailState": "جاري تحميل الإيميل",
    "successSignOutState": "تم تسجيل الخروج من التطبيق",
    "loadingSignOutState": "يتم تسجيل الخروج",
    "emptyFavProductState": "لا يوجد منتجات مفضلة لديك",
    "emptyOrdersState": "لا يوجد لديك اي أوردارات أطلب الأن",
    "checkYourEmailToConfirmChangeEmail": "برجاء تفقد بريدك الإلكتروني لتاكيد تغير الإيميل",
    "changeYorEmail": "تغير الإيميل الخاص بك",
    "writeNewEmail": "اكتب الإيميل الجديد",
    "writeYourPassword": "اكتب الباسورد الخاص بك",
    "confirmChangeEmail": "تأكيد تغير الإيميل",
    "successUpdateUserName": "تم تغير الإسم بنجاح",
    "changeYourName": "تغير الإسم الخاص بك",
    "writeNewName": "اكتب الإسم الجديد",
    "confirmationChangeYourName": "تأكيد تغير الإسم",
    "loadingChangeYourPassword": "يتم تغير كلمة المرور",
    "successChangeYourPassword": "تم تغير كلمة المرور بنجاح",
    "loadingData": "جاري تحميل البيانات",
    "pleaseConfirmYourPassword": "برجاء تأكيد الباسورد",
    "youDoNotHaveAnyCards": "لا يوجد لديك أي كارت بنكي"
  }
};
static const Map<String,dynamic> _en = {
  "home": {
    "goodMorning": "Good morning",
    "searchingTextField": "Search for.......",
    "bestSellerHomeHeader": "Best Seller",
    "bestSellerHomeAppBar": "Best Seller",
    "more": "More",
    "homeNavBar": "Home",
    "searchPageAppBar": "Search",
    "notificationsPageAppBar": "Notifications",
    "productsPageAppBar": "Products",
    "results": "Results",
    "productsNavBar": "Products",
    "sortBy": "Sort by :",
    "sortByPriceFromLowToHigh": "Price (Low to High)",
    "sortByPriceFromHighToLow": "Price (High to Low)",
    "sortByAlphabetical": "Alphabetical",
    "sort": "Filter",
    "cartPageAppBar": "Cart",
    "cartHeaderTagWhenYouHaveProducts": "You have items in your shopping cart",
    "cartHeaderTagWhenYouDontHaveProducts": "You have items in your shopping cart",
    "cartCheckOutButton": "Checkout EGP",
    "cartNavBar": "Shopping Cart",
    "egypyPound": "EGP",
    "amount": "Kilo",
    "eidOffers": "Eid Offers",
    "discountPercentage": "25% Off",
    "bannerButtom": "Shop Now"
  },
  "onBoarding": {
    "hello": "Welcome to ",
    "description1": "Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh, premium fruits and get the best deals and highest quality.",
    "shopping": "Search and Shop",
    "description2": "We offer you the finest carefully selected fruits. Check out details, photos, and reviews to make sure you choose the perfect fruit.",
    "startNow": "Start Now",
    "skipNow": "Skip"
  },
  "auth": {
    "loginPage": {
      "loginPageAppBar": "Login",
      "emailTextField": "Email",
      "passwordTextField": "Password",
      "forgetPassword": "Forgot Password?",
      "loginButton": "Login",
      "doNotHaveAnAccount": "Don't have an account?",
      "createNewAccount": "Create new account",
      "orLoginDivider": "OR",
      "signInWithGoogleButton": "Sign in with Google",
      "signInWithAppleButton": "Sign in with Apple",
      "signInWithFacebookButton": "Sign in with Facebook"
    },
    "signUp": {
      "signUpPageAppBar": "New Account",
      "nameTextField": "Full Name",
      "emailTextField": "Email",
      "passwordTextField": "Password",
      "termsAndConditions1": "By creating an account, you agree to",
      "termsAndConditions2": "our Terms and Conditions",
      "signUpButton": "Create New Account",
      "haveAnAccount": "Already have an account?",
      "signIn": "Sign In"
    },
    "forgetPassword": {
      "forgetPasswordPageAppBar": "Forgot Password",
      "forgetPasswordCondition": "Don't worry, just enter your email address and we will send a verification code.",
      "emailTextField": "Email",
      "forgetPasswordButton": "Forgot Password"
    },
    "resetYourPassword": {
      "resetYourPasswordPageAppBar": "New Password",
      "resetYourPasswordCondition": "Create a new password to log in",
      "resetYourPasswordTextFieldNewPass": "New Password",
      "resetYourPasswordTextFieldConfirmNewPass": "Confirm Password",
      "resetYourPasswordButton": "Create New Password",
      "resetYourPasswordDialog": "Password changed successfully"
    }
  },
  "checkOut": {
    "shippingStep": "Shipping",
    "cashOnDelivery": "Cash on Delivery",
    "DeliveryFromLocation": "Pickup from Location",
    "buyNowPayLater": "Buy Now, Pay Later",
    "yourPaymentMethod": "Please select a payment method",
    "addressStep": "Address",
    "addressNameTextField": "Full Name",
    "addressEmailTextField": "Email",
    "addressDetailsTextField": "Address",
    "addressCity": "City",
    "addressFloorNum": "Floor number, Apartment number...",
    "saveAddressSwitch": "Save Address",
    "yourNumberTextField": "Phone Number",
    "paymentOptionMainText": "Select appropriate payment method:",
    "paymentCardHolderNameTextField": "Cardholder Name",
    "paymentCardNumberTextField": "Card Number",
    "paymentCardExpirationDate": "Expiry Date",
    "paymentCardCVVNumber": "CVV",
    "paymentSaveSwitch": "Make Card Default",
    "orderSummarySection": "Order Summary:",
    "orderSummarySectionSubtotal": "Subtotal:",
    "orderSummarySectionDelivery": "Delivery:",
    "orderSummarySectionTotal": "Total",
    "confirmationOrder": "Please confirm your order",
    "paymentMethod": "Payment Method",
    "paymentMethodEditButton": "Edit",
    "shippingAddress": "Shipping Address",
    "shippingAddressEditButton": "Edit",
    "paymentStep": "Payment",
    "reviewPageAppBar": "Review",
    "reviewOrderNumber": "Order Number",
    "reviewStep": "Review",
    "shippingStepButton": "Next",
    "addressStepButton": "Address",
    "paymentStepButton": "Confirm & Continue",
    "reviewStepButton": "Confirm Order",
    "trackOrederButton": "Track Order",
    "trackOrderConfirmationText": "Successful!",
    "reviewGoToMainButton": "Home",
    "trackOrderPageAppBar": "Track Order",
    "trackOrderPageOrderNumber": "Order No:",
    "trackOrderPageOrderedAt": "Ordered At:",
    "trackOrderPageNumberOfItems": "Number of Items: ",
    "trackOrderPageTrackOrderStatus": "Track Order",
    "trackOrderPageAcceptOrderStatus": "Order Accepted",
    "trackOrderPageShippedOrderStatus": "Order Shipped",
    "trackOrderPageOutOfDeliveryOrderStatus": "Out for Delivery",
    "trackOrderPageDeliverdOrderStatus": "Delivered"
  },
  "profile": {
    "profileNavBar": "My Account",
    "profilePageAppBar": "My Account",
    "profilePageHeader": "General",
    "profileSection": "Profile",
    "myOrdersSection": "My Orders",
    "myPaymentsSection": "Payments",
    "myFavoriteSection": "Favorites",
    "myNotificationsSection": "Notifications",
    "myLanguageSection": "Language",
    "currentSection": "Theme",
    "profileFooterText": "Help",
    "whoAreSection": "About Us",
    "signOutSection": "Sign Out",
    "userProfileSectionPageAppBar": "Profile",
    "userProfilePagePersonalInfoHeader": "Personal Information",
    "userProfilePageChangePasswordHeader": "Change Password",
    "userProfilePageCurrentPasswordTextField": "Current Password",
    "userProfilePageNewPassword": "New Password",
    "userProfilePageConfirmationNewPassword": "Confirm New Password",
    "userProfilePageButton": "Save Changes",
    "myOrdersPageAppBar": "My Orders",
    "myOrdersPageItemOrderNumber": "Order No: ",
    "myOrdersPageOrderdAt": "Ordered At:",
    "myOrdersPageOrdersNumber": "Number of Items: ",
    "myOrdersPageTrackOrderStatus": "Track Order",
    "myOrdersPageAcceptOrderStatus": "Order Accepted",
    "myOrdersPageOrderShippedStatus": "Order Shipped",
    "myOrdersPageOrderOutOfDeliveryStatus": "Out for Delivery",
    "myOrdersPageOrderDeliverdStatus": "Delivered",
    "myPaymentsPageAppBar": "Payments",
    "myPaymentsPageButton": "Add New Payment Method",
    "addNewPaymentPageAppBar": "Add New Card",
    "addNewPaymentPageCardHolderName": "Cardholder Name",
    "addNewPaymentPageCardNumber": "Card Number",
    "addNewPaymentPageCardExpireDate": "Expiry Date",
    "addNewPaymentPageCardCVV": "CVV",
    "addNewPaymentMakeCardDefault": "Make Card Default",
    "myFavoritePageAppBar": "Favorites",
    "whoArePageAppBar": "About Us",
    "wantToLogOut": "Are you sure you want to sign out?",
    "okLogOut": "Confirm",
    "idonot": "Cancel"
  },
  "itemDetails": {
    "itemDetailsItemPound": "EGP",
    "itemDetailsItemAmount": "Kilo",
    "itemDetailsReviewItemButton": "Reviews",
    "itemDetailsAddToCartButton": "Add to Cart",
    "itemDetailsExpirationDate": "Expiration",
    "itemDetailsOrganicItem": "Organic",
    "itemDetailsReviewsItem": "Reviews",
    "itemDetailsCaloryBy100GM": "100g",
    "itemDetailsCaloryItem": "Calories",
    "itemDetailsExpireOneYear": "1 Year",
    "itemDetailsExpireTwoYear": "2 Years",
    "itemDetailsExpireThreeYear": "3 Years",
    "itemDetailsExpireFourYear": "4 Years"
  },
  "reviewAndRating": {
    "reviewAndRatingPageAppBar": "Reviews",
    "reviewAndRatingTextField": "Write a review...",
    "reviewAndRatingReviewsText": "Reviews",
    "reviewAndRatingSummary": "Summary",
    "reviewAndRatingRecommendedText": "Recommended",
    "reviewAndRatingAddReviewButton": "Add Review",
    "reviewAndRatingAddReviewTextField": "Leave a review..."
  },
  "cart": {
    "cartCurrency": "EGP",
    "cartAmount": "Kg"
  },
  "databaseErrors": {
    "addDataError": "An error occurred while adding data, please try again.",
    "getDataError": "Failed to load data, please check your internet connection.",
    "getSingleDataError": "Failed to find the requested data.",
    "getNestedDataError": "Failed to load related data.",
    "getQueryDataError": "An error occurred while searching for data.",
    "removeDataError": "Failed to delete data.",
    "updateDataError": "An error occurred while updating data.",
    "getStreamData": "An error occurred while fetching data."
  },
  "storageErrors": {
    "addFileError": "Failed to upload image to database."
  },
  "authErrors": {
    "generalError": "Something went wrong, please try again.",
    "weakPasswordError": "The password provided is too weak.",
    "emailAlreadyInUseError": "This email address is already in use.",
    "invalidEmailError": "Incorrect email or password, please try again.",
    "networkError": "No internet connection.",
    "userNotFoundError": "User account not found.",
    "wrongPasswordError": "Incorrect email or password, please try again.",
    "invalidCreadintialError": "Something went wrong, please try again."
  },
  "loginCubit": {
    "successSignInState": "Signed in successfully",
    "successSignInWithGoogleState": "Signed in successfully with Google",
    "successSignInWithFacebookState": "Signed in successfully with Facebook"
  },
  "sendResetPasswordEmailCubit": {
    "successSendEmailState": "Please check your email"
  },
  "termsAndConditions": {
    "failureTermsAndConditionsState": "Please accept the terms and conditions"
  },
  "registerCubit": {
    "successRegisterState": "Account created successfully"
  },
  "resetPassword": {
    "failureConfirmPasswordState": "Password confirmation does not match"
  },
  "cartCubit": {
    "cartItemIncremented": "Increased quantity of ",
    "cartItemDecremented": "Decreased quantity of "
  },
  "checkOutSteps": {
    "pleaseSpecifyPaymentMethod": "Please select a payment method",
    "completeTheInformation": "Please complete your information",
    "city": "City: ",
    "address": "Address: ",
    "floorNumber": "Apartment Number: ",
    "successAddOrderState": "Your order has been placed successfully",
    "loadingAddYourOrderState": "Placing your order...",
    "pleaseCompleteAddressDetails": "Please complete the delivery details"
  },
  "itemDetailsStatus": {
    "loadingReviewsForThisItem": "Loading reviews for this item...",
    "beTheFirstOneToAddReview": "Be the first to leave a review",
    "nothing": "None"
  },
  "time": {
    "morning": "AM",
    "night": "PM"
  },
  "homeStatus": {
    "loadingYourName": "Loading name...",
    "addProductToFav": "Added to favorites",
    "removeProductFromFav": "Removed from favorites",
    "addProductToCart": "Product added successfully",
    "loadingAddProductToCart": "Adding product to cart...",
    "productIncrementedInCart": "Item quantity increased successfully",
    "productDecrementedFromCart": "Item quantity decreased successfully"
  },
  "search": {
    "searchResults": "Search Results",
    "recentSearchResult": "Recent Searches",
    "deleteAll": "Delete All",
    "noSearchResults": "No search results found",
    "search": "Search",
    "EmptySearchResult": "Sorry, this information is not available right now"
  },
  "products": {
    "loadingProductsState": "Loading products...",
    "nothingProductsState": "No products available"
  },
  "profileStatus": {
    "successAddNewCardState": "Card added successfully",
    "successUpdateUserImageState": "Profile picture updated successfully",
    "editPhotoButton": "Edit Photo",
    "loadingYourNameState": "Loading name...",
    "loadingYourEmailState": "Loading email...",
    "successSignOutState": "Signed out successfully",
    "loadingSignOutState": "Signing out...",
    "emptyFavProductState": "You have no favorite products",
    "emptyOrdersState": "You have no orders yet. Order now!",
    "checkYourEmailToConfirmChangeEmail": "Please check your email to confirm the change",
    "changeYorEmail": "Change Your Email",
    "writeNewEmail": "Enter new email",
    "writeYourPassword": "Enter your password",
    "confirmChangeEmail": "Confirm Email Change",
    "successUpdateUserName": "Name updated successfully",
    "changeYourName": "Change Your Name",
    "writeNewName": "Enter new name",
    "confirmationChangeYourName": "Confirm Name Change",
    "loadingChangeYourPassword": "Changing password...",
    "successChangeYourPassword": "Password changed successfully",
    "loadingData": "Loading data...",
    "pleaseConfirmYourPassword": "Please confirm your password",
    "youDoNotHaveAnyCards": "You have no saved payment cards"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
