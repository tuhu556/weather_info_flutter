abstract class AppModule {
  Future<AppLocalDatabase> get preft => AppLocalDatabase.create();
}
