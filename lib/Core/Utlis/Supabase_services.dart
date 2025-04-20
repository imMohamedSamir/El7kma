import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  final SupabaseClient _client = Supabase.instance.client;

  /// GET all rows or filtered
  Future<List<Map<String, dynamic>>> get({
    required String table,
    Map<String, dynamic>? filters,
  }) async {
    var query = _client.from(table).select();

    filters?.forEach((field, value) {
      query = query.eq(field, value);
    });

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }

  /// INSERT a new record
  Future<Map<String, dynamic>?> insert({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    final response = await _client.from(table).insert(values).select().single();
    return response;
  }

  /// UPDATE existing record by [id]
  Future<Map<String, dynamic>?> update({
    required String table,
    required String id,
    required Map<String, dynamic> values,
    String idField = 'id',
  }) async {
    final response = await _client
        .from(table)
        .update(values)
        .eq(idField, id)
        .select()
        .single();

    return response;
  }

  /// DELETE record by [id]
  Future<void> delete({
    required String table,
    required String id,
    String idField = 'id',
  }) async {
    await _client.from(table).delete().eq(idField, id);
  }

  /// GET with custom filter operators
  Future<List<Map<String, dynamic>>> getWithFilter({
    required String table,
    required String column,
    required dynamic value,
    String operator = 'eq',
  }) async {
    var query = _client.from(table).select();

    switch (operator) {
      case 'eq':
        query = query.eq(column, value);
        break;
      case 'neq':
        query = query.neq(column, value);
        break;
      case 'like':
        query = query.like(column, value);
        break;
      case 'ilike':
        query = query.ilike(column, value);
        break;
      case 'contains':
        query = query.contains(column, value);
        break;

      case 'gte':
        query = query.gte(column, value);
        break;
      case 'lte':
        query = query.lte(column, value);
        break;
      default:
        throw ArgumentError('Unsupported operator: $operator');
    }

    final response = await query;
    return List<Map<String, dynamic>>.from(response);
  }
}
