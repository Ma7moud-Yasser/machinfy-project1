import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  TextEditingController userNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();

  bool isNotVisible = true;
  String selectedFlag = "🌍";
  Map<String, Map<String, dynamic>> countriesData = {
    "Egypt": {
      "flag": "🇪🇬",
      "regions": {
        "Cairo": ["Nasr City", "Maadi", "New Cairo", "Zamalek", "Abbaseya"],
        "Giza": [
          "Dokki",
          "Mohandessin",
          "Haram",
          "6th of October",
          "Sheikh Zayed",
        ],
        "Alexandria": [
          "Agami",
          "Moharam Bek",
          "Smouha",
          "San Stefano",
          "Kafr Abdo",
        ],
      },
    },
    "Russia": {
      "flag": "🇷🇺",
      "regions": {
        "Moscow": ["Moscow Center", "Tushino", "Zaporozhsky", "Ryazanka"],
        "Saint Petersburg": ["Nevsky", "Petrogradsky", "Krasnogvardeysky"],
        "Sochi": ["Adler", "Lazarevskoye", "Central Sochi"],
      },
    },
  };

  List<String> getCountriesList() {
    return countriesData.entries
        .map((entry) => "${entry.value['flag']} ${entry.key}")
        .toList();
  }

  void updateSelectedCountry(String country, String flag) {
    cityController.text = country;
    selectedFlag = flag;
    emit(SignUpUpdatedState());
  }

  List<String> getRegionsByCountry(String country) {
    return countriesData[country]?["regions"]?.keys.toList() ?? [];
  }

  List<String> getCitiesByRegion(String country, String region) {
    return countriesData[country]?["regions"]?[region] ?? [];
  }

  void signUp() {}

  void toggleVisibleConfirmPassword() {
    isNotVisible = !isNotVisible;
    emit(ToggleVisibleConfirmPasswordState());
  }
}
