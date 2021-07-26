import 'package:materials/app/data/services/app_exception.dart';
import 'package:materials/app/ui/android/widgets/dialog_helper.dart';

class BaseController {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is FetchDataException) {
      DialogHelper.showErrorDialog(description: error.message);
    } else if (error is ApiNotRespondingException) {
      DialogHelper.showErrorDialog(description: error.message);
    }
  }

  showLoading() {
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}
