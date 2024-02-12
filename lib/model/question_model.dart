// ignore_for_file: avoid_print

class Question {
  String question;

  String answer1;

  String answer2;

  int trueAnswer;

  String imageAddress;

  Question(this.question, this.answer1, this.answer2, this.trueAnswer,
      this.imageAddress);

  bool isRight(int num) {
    if (num == 1 || num == 2) {
      if (trueAnswer == 1) {
        if (num == 1) {
          return true;
        } //
        else {
          return false;
        }
      } //
      else {
        if (num == 2) {
          return true;
        } //
        else {
          return false;
        }
      }
    } //
    else {
      print('error in handle');
      return false;
    }
  }
}

List<Question> questionList = [
  Question('واحد پول کشور ژاپن کدام است؟', 'یوان', 'پن', 1,
      'assets/images/banknote.png'),
  Question('غذای سوشی از کدام کشور آمده؟', 'تایلند', 'ژاپن', 2,
      'assets/images/sushi.png'),
  Question('برج کج پیزا در کدام کشور است؟', 'اسپانیا', 'ایتالیا', 2,
      'assets/images/tower.png'),
  Question('رنگ سبز از ترکیب چه رنگ هایی بوجود می آید؟', 'آبی و قرمز',
      'آبی و زرد', 2, 'assets/images/green color.png'),
  Question('آیا اختاپوس ها می توانند رنگ پوست خود را تغییر دهند؟', 'بله', 'خیر',
      1, 'assets/images/octopus.png'),
  Question("کتاب هملت را چه کسی نوشته؟", 'شکسپیر', 'داوینچی', 1,
      'assets/images/Hamlet.png'),
  Question('پایتخت کانادا کدام است؟', 'ونکوور', 'تورانتو', 2,
      'assets/images/canada.png'),
  Question('کدام مهره شطرنج نمیتواند در یک خط صاف حرکت کند؟', 'سرباز', 'اسب', 2,
      'assets/images/chess.png'),
  Question('شهر آمستردام در کدام کشور قرار دارد؟', 'هلند', 'فنلاند', 1,
      'assets/images/Amsterdam.png'),
  Question('پر جمعیت ترین کشور جهان کدام است؟', 'هند', 'چین', 1,
      'assets/images/world.png'),
];
