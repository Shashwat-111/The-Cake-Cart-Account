import 'package:gsheets/gsheets.dart';
import 'Data Fetching.dart';

class AppSheetApi{

  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "cakecartproject",
  "private_key_id": "ad5e9d609ff669dbb52ffad45c8c4f988bd5a9ce",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDEmWZ82QNpBrJA\nBrnbA3HCvQRzboqOAhq/EP6yUTs4Y8v/pQBNALO3+GsTD3e4Mha/FVNCa0uMDv8l\n1vCVUWfe3+PwAXD0lorQDy8p2OPlBJES2ylDfjMG60Ul71YLkvuN0BJh0aXla1iz\nKYX50bBjDPgtS64Iv1fJelcOofcfS0aOm5PydJ2ZzQOoCdb3s9FSzJKuJb61U4JM\n0b4oQxZsheNNKCLKBJ+8jeK3irFgjF9wnIvSLFMtcstZAmBMQc9U9pXE1bkegQSx\n4xDEiv/yim9rpBhnyri8mZu9WPZJd2nL+9UVIXUWgZ4T5FSYX1WzXk+mgfgITgb7\nlYz/7YBdAgMBAAECggEACwBX3y34UOI9C0l/u6UVB+6ygbsdKcEtufoQ0UMBFgYP\nnlNKEa+ztDHEhsvbc9qUXJusOGVEqaZqhLWNv5f561uKp8g3h+2nVZPj8cA0pdYm\n6sU00+q19EcqFsCuh0tG+bKRChmZ4kgALgEULDHzCuKTk1qkIdKDQ7+tgMtzcV7D\nMzul0/J0J9mh6cNxb1d5NLv5iheAJ8gFYW5zDGcXM1yKpx/SejOFvIBr2Sbc2y3A\nTHa0/eLSmvJ1847asTYyNJMGrChwTHddL89+6yTqRkWhOkUEZntmoiN9wgt1ZUdv\nHwKUysLRE0ZlFVjKiu3uu63G78vmHNUikcgSCw9qyQKBgQDo3VP8X1KA+w7guZ53\n18SgSTTvPJG1li1KR1ntcEdRetvqIyYoGPUzoZ3MOz8XwcA+dVu1VDYlg+AWW8aq\ndPyoQzLdTKvEHsSg3jGeUI258MudMcWns3U8+mjdxRmbBc0vDR90KO1lIiOu+7qX\n9N6q7GCwhc/L08VCj+9zpy7PqwKBgQDYIbNMNo0vrdXjCBsyoIu0KgoNxqsZyRcP\nSw19xt2YML1U6W2B7S+hV4ScB6um4WVdduzIlSZnJtKh9EnXEE8bDjweKcO62428\n0RYCWOqbLgI934YFDYM+mDSQuLuOZ00I068E00lvKbBTcjiLGKZK5EX9fOum9xyE\ndhMxpzKIFwKBgQCBsrSSfi0ftbWlqP0AVucnN18KWLv3XbvAAVmvC7hNQ5a1I/qe\nnrgDl+Kh2+XaP4npv8fiiRLXdkobaeaPDjWjKjpsU8XfqBtwVhFg0hD+HYXq+cvT\nCfskiXxa+Oq4E1Ui/bYlJp6Ck684SPC2riZPIPUBnKYOKtdVqYF+8wD5nQKBgEnQ\n4LrD2t6Q4X8Dsr5MxMoInZxs4N0Sp/SKLpZpiB9FbjSE8OiyCFVzXZAosoBxdLxC\nNMag4hfS05eKpnl0UYAtEW0/2GCGQddeFcVBdwb+5LcbE1vAbLXBKBrRbQVK1K2S\nFrFwNCFqPJWTaipfhdQIOLtFofpJZYz8ArwvnXuLAoGABNir3xt0WVyn5d9GMpeX\nlGPP7IEm1q7eVTxEF6LNTspGOaKWSEG/RgIsukSf1N9AfKKUUEmAoptsgXEm2xyq\n5tXsfDPer5ynPmQ8b9vGbifsW8XV3A5Pdj+mVjss0J3nG18b2K6A8rDlCN1sGdt5\nUI1OGkRFkzRSRf7DjaqzoyE=\n-----END PRIVATE KEY-----\n",
  "client_email": "cakecartproject@cakecartproject.iam.gserviceaccount.com",
  "client_id": "112169163950146332897",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cakecartproject%40cakecartproject.iam.gserviceaccount.com"
}
''';

  static final _spreadSheetID = "1PpuRV9mQFZn3_g1UJudonUvEcGwa2eERapl_CH5PE5I";
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheet.spreadsheet(_spreadSheetID);
      _userSheet =
      await _getWorkSheet(spreadsheet, title: 'PurchaserDetailsSheet');
      final firstRow = PurchaserDetails.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    }
    catch(e)
    {
      print('Init error: $e');
    }
  }


  static Future<Worksheet> _getWorkSheet(
      Spreadsheet spreadsheet, {required String title,}
      )

  async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

}


