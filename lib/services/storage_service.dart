import 'package:shared_preferences/shared_preferences.dart';
import '../models/bookmark.dart';

class StorageService {
  Future<void> saveBookmark(Bookmark bookmark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bookmark_${bookmark.surahId}_${bookmark.ayahId}', 'true');
  }

  Future<List<Bookmark>> getBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    // Implement logic to retrieve bookmarks
    return [];
  }
}