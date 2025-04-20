import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

part 'note_db.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get desc => text().withLength(min: 1, max: 255)();

}

@DriftDatabase(tables: [Notes])
class NoteDb extends _$NoteDb {
  NoteDb() : super(SqfliteQueryExecutor(path: "notes.sqflite"));


  @override
  int get schemaVersion => 1;

  //CRUD

  //READ DATA (One Time)
  Future<List<Note>> fetchNotes() => select(notes).get();

  //READ DATA (Real Time)
  Stream<List<Note>> streamNotes() => select(notes).watch();

  //INSERT DATA
  Future<int> insertNote(Note note) => into(notes).insert(note);

  //UPDATE DATA
  Future<bool> updateNote(Note note) => update(notes).replace(note);

  //DELETE DATA
  Future<int> deleteNote(Note note) => delete(notes).delete(note);
}