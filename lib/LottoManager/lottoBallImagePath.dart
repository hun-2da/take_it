class lottoImagePath{
  static const int w = 0;
  static const int r = 100000;
  static const int o = 10000;
  static const int y = 1000;
  static const int b = 100;
  static const int p = 10;
  static const int g = 1;

  static String ball645imagePath(int number){
    String path = 'assets/images/lotto645/ball_$number.png';
    return path;
  }

  static String ball720imagePath(int color,int number){
    String path = 'assets/images/lotto720/ball';

    switch(color){
      case w:
        path = '${path}W_$number.png';
        break;
      case r:
        path = '${path}R_$number.png';
        break;
      case o:
        path = '${path}O_$number.png';
        break;
      case y:
        path = '${path}Y_$number.png';
        break;
      case b:
        path = '${path}B_$number.png';
        break;
      case p:
        path = '${path}P_$number.png';
        break;
      case g:
        path = '${path}G_$number.png';
        break;
        default : path = 'assets/images/ball_icon.png';
    }

    return path;
  }
}