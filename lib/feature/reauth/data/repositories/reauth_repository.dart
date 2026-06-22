import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moding_president_web/core/services/token_storage.dart';
import 'package:moding_president_web/feature/reauth/data/data_sources/reauth_data_source.dart';

final reauthRepositoryProvider = Provider<ReauthRepository>((ref) {
  return ReauthRepository(
    ref.watch(reauthDataSourceProvider),
    ref.watch(tokenStorageProvider),
  );
});

class ReauthRepository {
  ReauthRepository(this._dataSource, this._tokenStorage);

  final ReauthDataSource _dataSource;
  final TokenStorage _tokenStorage;

  Future<void> issueAndSaveReauthKey(String password) async {
    final reauthKey = await _dataSource.issueReauthKey(password);
    await _tokenStorage.saveReauthKey(reauthKey);
  }

  Future<String?> getStoredReauthKey() {
    return _tokenStorage.getReauthKey();
  }

  Future<void> clearStoredReauthKey() {
    return _tokenStorage.deleteReauthKey();
  }
}
