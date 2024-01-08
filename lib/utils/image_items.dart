enum JpgImageItems {background}

extension JpgImageItemsExtension on JpgImageItems {
  String _jpgPath() {
    switch (this) {

      case JpgImageItems.background:
        return "background";
    }
  }

  String get jpgPath => "images/${_jpgPath()}.jpg";
}


enum GifImageItems {keyboard,car}

extension GifImageItemsExtension on GifImageItems {
    String _gifPath() {
       switch (this) {
        
         case GifImageItems.keyboard:
           return "keyboard_gif2";
           
         case GifImageItems.car:
           return "car_gif3";
       
       }
    }  

    String get gifPath => "images/${_gifPath()}.gif";
}


enum PngImageItems {car,apple,facebook,google,twitter}

extension PngImageItemsExtension on PngImageItems {
    String _pngPath() {
       switch (this) {
        
         case PngImageItems.car:
           return "car_icon";

         case PngImageItems.apple:
           return "apple_icon";
           
         case PngImageItems.facebook:
           return "facebook_icon";
           
         case PngImageItems.google:
           return "google_icon";

         case PngImageItems.twitter:
          return "twitter_icon";
       }
    }  

    String get pngPath => "images/${_pngPath()}.png";
}

