import 'package:materials/services/app_exception.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
    } else if (error is FetchDataException) {
    } else if (error is ApiNotRespondingException) {}
  }
}
