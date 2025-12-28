import 'package:ppob_koperasi_payment/data/dialogMixin/dialog_mixin.dart';
import 'package:ppob_koperasi_payment/data/remote/api_response.dart';

class _DialogHelper with DialogMixin {}

extension ApiResponseExtension<T> on Future<ApiResponse<T>> {
  Future<T?> get validateResponse async {
    final response = await this;
    if (response.status == true) {
      return response.data;
    } else {
      _DialogHelper().showErrorSnackbar(response.message);
      return null;
    }
  }
}

extension ApiResponseListExtension<T> on Future<ApiResponseList<T>> {
  Future<List<T>?> get validateResponse async {
    final response = await this;
    if (response.status == true) {
      return response.data;
    } else {
      _DialogHelper().showErrorSnackbar(response.message);
      return null;
    }
  }
}
