import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppKeys {
  static const String urlSupabase = 'https://tvyagifhdfyzvcaidjqg.supabase.co';
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR2eWFnaWZoZGZ5enZjYWlkanFnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQwMzU0MzIsImV4cCI6MjA1OTYxMTQzMn0.ai-O_YpRAJLmAgj_rnckbOhmem94IP_k9SguomrvkMc';
  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: urlSupabase,
      anonKey: anonKey,
    );
  }
}
