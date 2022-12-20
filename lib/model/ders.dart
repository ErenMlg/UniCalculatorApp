// ignore_for_file: public_member_api_docs, sort_constructors_first

class Ders {
  final String ad;
  final double harfDegeri;
  final int krediDegeri;

  Ders({
    required this.ad,
    required this.harfDegeri,
    required this.krediDegeri,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$ad $harfDegeri $krediDegeri';
  }
}
