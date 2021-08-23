import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/model/db/Constants.dart';
import 'package:untitled1/model/db/Favorites.dart';


class DbHelper {
  static DbHelper _helper;

  DbHelper._getInstance();

  factory DbHelper() {
    if (_helper == null) _helper = DbHelper._getInstance();
    return _helper;
  }

  createDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, Constants.DB_NAME);
    return openDatabase(
      dbPath,
      version: Constants.DB_VERSION,
      onCreate: (db, version) => _createFavoritesDb(db),
    );
  }

  _createFavoritesDb(Database db) {
    String sql =
        "create table ${Constants.TABLE_NAME}"
        " ( ${Constants.COL_ID} integer primary key autoincrement,"
        " ${Constants.COL_IMG} text "
        " ${Constants.COL_NAME} text "
        " ${Constants.COL_PRICE} text "
        ")";

    print(sql);
    db.execute(sql);
  }

  Future<int>saveFavorites(Favorites favorites) async {
    Database db = await createDB();
    int row =await db.insert(Constants.TABLE_NAME, favorites.toMap());
    print(row);
    return row;
  }

 Future<List<Favorites>> viewFavorites() async {
    Database db = await createDB();
    List<Map<String,dynamic>> mapList = await db.query(Constants.TABLE_NAME);
    print(mapList);
    return mapList.map((e) =>Favorites.fromMap(e)).toList();

  }
  Future<int> updateFavorites(Favorites favorites) async{
    Database database=await createDB();
    return await database.update(Constants.TABLE_NAME, favorites.toMap() , where: Constants.COL_ID+"=?" , whereArgs: [favorites.favoritesId] );
  }
  Future<int>deleteFavorites(Favorites favorites) async{
    Database database=await createDB();
    return await database.delete(Constants.TABLE_NAME,  where: Constants.COL_ID+"=?" , whereArgs: [favorites.favoritesId] );
  }
}


