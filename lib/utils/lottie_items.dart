enum LottieItems { lottieImage, lottieRepair, themeChange, splash,search}

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      
      case LottieItems.lottieImage:
         return "lottie_car_change";
         
      case LottieItems.lottieRepair:
         return "lottie_repair";

      case LottieItems.themeChange:
        return "theme_change";
        
      case LottieItems.splash:
        return "lottie_splash";
      case LottieItems.search:
        return "lottie_search";
    }
  }

  String get lottiePath => "images/lottie/${_path()}.json";
}

