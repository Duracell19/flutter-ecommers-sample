import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "ecommers"
  String get ecommers => "ecommers";
  /// "ecommers Home Page"
  String get titleHomePage => "ecommers Home Page";
  /// "Home page"
  String get homePageTitle => "Home page";
  /// "Categories"
  String get categoriesTitle => "Categories";
  /// "Latest"
  String get latetstTitle => "Latest";
  /// "See All"
  String get seeAllCategoryTitle => "See All";
  /// "Cart"
  String get cartTitle => "Cart";
  /// "TOTAL"
  String get totalOrder => "TOTAL";
  /// "Free Domestic Shipping"
  String get freeDomesticShipping => "Free Domestic Shipping";
  /// "CHECKOUT"
  String get checkoutButton => "CHECKOUT";
  /// "EDIT PROFILE"
  String get editProfile => "EDIT PROFILE";
  /// "LOG OUT"
  String get logOut => "LOG OUT";
  /// "More"
  String get morePage => "More";
  /// "Checkout"
  String get checkoutTitle => "Checkout";
  /// "PLACE ORDER"
  String get placeOrderButton => "PLACE ORDER";
  /// "Add Prome Code"
  String get addPromoCode => "Add Prome Code";
  /// "ITEMS"
  String get items => "ITEMS";
  /// "PAYMENT METHOD"
  String get paymentMethod => "PAYMENT METHOD";
  /// "SHIPPING ADDRESS"
  String get shippingAddress => "SHIPPING ADDRESS";
  /// "Master Card ending"
  String get cardEnding => "Master Card ending";
  /// "All Categories"
  String get allCategories => "All Categories";
  /// "Sign Up"
  String get signUp => "Sign Up";
  /// "Log In"
  String get logIn => "Log In";
  /// "Forgot Password"
  String get forgotPassword => "Forgot Password";
  /// "EMAIL"
  String get email => "EMAIL";
  /// "USERNAME"
  String get username => "USERNAME";
  /// "PASSWORD"
  String get password => "PASSWORD";
  /// "USERNAME / EMAIL"
  String get usernameOrEmail => "USERNAME / EMAIL";
  /// "Enter the email address you used to create your account and we will email you a link to reset your password"
  String get forgotPasswordHelpText => "Enter the email address you used to create your account and we will email you a link to reset your password";
  /// "Your order was placed successfully. For more details, check All My Orders page under Profile tab"
  String get successMessage => "Your order was placed successfully. For more details, check All My Orders page under Profile tab";
  /// "Attention"
  String get alertTitle => "Attention";
  /// "Username or password is incorrect."
  String get alertLoginText => "Username or password is incorrect.";
  /// "Don’t have an account? Swipe right to \n"
  String get loginBottomTextSpan1 => "Don’t have an account? Swipe right to \n";
  /// "create a new account."
  String get loginBottomTextSpan2 => "create a new account.";
  /// "REFINE RESULTS"
  String get refineResults => "REFINE RESULTS";
  /// "CLEAR"
  String get clear => "CLEAR";
  /// "APPLY FILTERS"
  String get applyFilters => "APPLY FILTERS";
  /// "By creating an account, you agree to our Privacy Policy \n"
  String get signUpBottomTextSpan1 => "By creating an account, you agree to our Privacy Policy \n";
  /// "Terms of Service"
  String get signUpBottomTextSpan2 => "Terms of Service";
  /// " and "
  String get signUpBottomTextSpan3 => " and ";
  /// "Privacy Policy"
  String get signUpBottomTextSpan4 => "Privacy Policy";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "US")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_US" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}