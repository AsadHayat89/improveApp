class Api_Url {
//========================================================================
  //BASE URL
//========================================================================

  static const String BASE_URL = "http://improve.improvescrape.com/api/improve";
  static const String BASE_URL_IMAGE = BASE_URL + "/uploads/";

  //========================================================================
  //Api points
//========================================================================

  static const String MIDDLE_BASE = "api";

  static const String LOGIN_Url = "$BASE_URL/auth/login";
  static const String Reg_Url = "$BASE_URL/auth/register";
  static const String UPDATE_PROFILE_Url = "$BASE_URL/profile/update";
  static const String ADD_LOGO_Url = "$BASE_URL/logo/addlogo";
  static const String SHOW_ALL_LOGO_Url = "$BASE_URL/logo/showall";
  static const String SHOW_ALL_GROUP = "$BASE_URL/chat/showgroup";
  static const String SHOW_MY_GROUP = "$BASE_URL/chat/showmygroup/";
  static const String SEND_MESSAGE_CHAT_Url = "$BASE_URL/chat/sendmessage";
  static const String SHOW_MESSAGE_CHAT_Url = "$BASE_URL/chat/groupdata/";
  static const String ADD_GROUP_Url = "$BASE_URL/chat/groupadd";
  static const String DELETE_LOGO_Url = "$BASE_URL/logo/delete/";
  static const String JOIN_GROUP_Url = "$BASE_URL/chat/groups";
  static const String PAYMENT_Url = "$BASE_URL/payment/postpayment";


}
