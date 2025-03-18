import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('quan_ly_chi_tieu.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE loai_chi_tieu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        ten_loai TEXT NOT NULL,
        mo_ta TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE chi_tieu (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        server_id TEXT UNIQUE NULL,
        so_tien REAL NOT NULL,
        ngay_gio TEXT NOT NULL,
        ghi_chu TEXT NULL,
        loai_id INTEGER NOT NULL,
        trang_thai_dong_bo INTEGER DEFAULT 0,
        deleted INTEGER DEFAULT 0,
        FOREIGN KEY (loai_id) REFERENCES loai_chi_tieu (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE thu_nhap (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        server_id TEXT UNIQUE NULL,
        so_tien REAL NOT NULL,
        nguon_thu TEXT NOT NULL,
        ngay_gio TEXT NOT NULL,
        ghi_chu TEXT NULL,
        trang_thai_dong_bo INTEGER DEFAULT 0,
        deleted INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE muc_tieu_tiet_kiem (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        server_id TEXT UNIQUE NULL,
        ten_muc_tieu TEXT NOT NULL,
        so_tien_muc_tieu REAL NOT NULL,
        so_tien_da_tiet_kiem REAL DEFAULT 0,
        thoi_han TEXT NULL,
        trang_thai_dong_bo INTEGER DEFAULT 0,
        deleted INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE nguoi_dung_cai_dat (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nguoi_dung_id INTEGER NOT NULL,
        loai_tien_te TEXT DEFAULT 'VND',
        thong_bao INTEGER DEFAULT 1
      )
    ''');
  }

  // Đồng bộ dữ liệu từ SQLite lên Firestore
  Future<void> syncChiTieuToFirebase(String userId) async {
    final db = await database;
    final List<Map<String, dynamic>> chiTieuList = await db.query(
      'chi_tieu',
      where: 'trang_thai_dong_bo = 0 AND deleted = 0',
    );

    for (var chiTieu in chiTieuList) {
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('chi_tieu')
          .doc();

      await docRef.set({
        'so_tien': chiTieu['so_tien'],
        'ngay_gio': chiTieu['ngay_gio'],
        'ghi_chu': chiTieu['ghi_chu'],
        'loai_id': chiTieu['loai_id'],
        'last_updated': DateTime.now().millisecondsSinceEpoch,
        'deleted': false,
      });

      await db.update(
        'chi_tieu',
        {'server_id': docRef.id, 'trang_thai_dong_bo': 1},
        where: 'id = ?',
        whereArgs: [chiTieu['id']],
      );
    }
  }

  // Hàm lấy dữ liệu từ Firestore về SQLite
  Future<void> syncFirebaseToSQLite(String userId) async {
    final db = await database;
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chi_tieu')
        .get();

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final existing = await db.query(
        'chi_tieu',
        where: 'server_id = ?',
        whereArgs: [doc.id],
      );

      if (existing.isEmpty) {
        await db.insert('chi_tieu', {
          'server_id': doc.id,
          'so_tien': data['so_tien'],
          'ngay_gio': data['ngay_gio'],
          'ghi_chu': data['ghi_chu'],
          'loai_id': data['loai_id'],
          'trang_thai_dong_bo': 1,
        });
      } else {
        await db.update(
          'chi_tieu',
          {'so_tien': data['so_tien'], 'trang_thai_dong_bo': 1},
          where: 'server_id = ?',
          whereArgs: [doc.id],
        );
      }
    }
  }

  // Đồng bộ tự động khi có mạng
  Future<void> autoSync(String userId) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      await syncChiTieuToFirebase(userId);
      await syncFirebaseToSQLite(userId);
    }
  }
}
