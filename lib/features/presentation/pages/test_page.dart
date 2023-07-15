import 'package:base/features/presentation/pages/aboutus_page.dart';
import 'package:base/features/presentation/pages/account_page.dart';
import 'package:base/features/presentation/pages/balance_page.dart';
import 'package:base/features/presentation/pages/calculator_page.dart';
import 'package:base/features/presentation/pages/claim_point_page.dart';
import 'package:base/features/presentation/pages/friend_page.dart';
import 'package:base/features/presentation/pages/home_page.dart';
import 'package:base/features/presentation/pages/myteam_page.dart';
import 'package:base/features/presentation/pages/payment_page.dart';
import 'package:base/features/presentation/pages/setting_page.dart';
import 'package:base/features/presentation/pages/user_account_page.dart';
import 'package:base/features/presentation/pages/landing_page.dart';
import 'package:base/features/presentation/pages/user_login_page.dart';
import 'package:base/features/presentation/pages/user_login_test_page.dart';
import 'package:base/features/presentation/pages/user_register_page.dart';
import 'package:base/features/presentation/pages/wallet_page.dart';
import 'package:base/features/presentation/providers/crpyto_provider.dart';
import 'package:base/features/presentation/providers/dashboard_provider.dart';
import 'package:base/features/presentation/providers/referral_provider.dart';
import 'package:base/features/presentation/providers/user_provider.dart';
import 'package:base/features/presentation/providers/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../domain/usecases/user_login.dart';

class TestPage extends StatefulWidget {
  static String routeName = "/TestPage";
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: ListView(
        children: [

          ListTile(title: Text("Login Test"), onTap: _login,),
          ListTile(title: Text("Get Currency List"), onTap: _getCurrency,),
          ListTile(title: Text("Get Dashboard"), onTap: _getDashboard,),
          ListTile(title: Text("Get Referral List"), onTap: _getReferralList,),
          ListTile(title: Text("Get Deposit Address"), onTap: _getDepositAddressList,),
          ListTile(title: Text("Get Deposit Transaction List"), onTap: _getDepositTransactionList,),
          ListTile(title: Text("Get Withdraw Transaction List"), onTap: _getWithdrawTransactionList,),
          ListTile(title: Text("Request Deposit"), onTap: _requestDeposit,),
          ListTile(title: Text("Request Withdraw"), onTap: _requestWithdraw,),
          Divider(),
          ListTile(title: Text("Landing Page"), onTap: (){ Navigator.pushNamed(context, LandingPage.routeName); },),
          ListTile(title: Text("User Login Page"), onTap: (){ Navigator.pushNamed(context, UserLoginPage.routeName); },),
          // ListTile(title: Text("Landing Page"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          // ListTile(title: Text("Landing Page Two"), onTap: (){ Navigator.pushNamed(context, UserLoginTestPage.routeName); },),
          ListTile(title: Text("Home Page"), onTap: (){ Navigator.pushNamedAndRemoveUntil(context, HomePage.routeName, (route) => false); },),
          ListTile(title: Text("Claim Page"), onTap: (){ Navigator.pushNamed(context, ClaimPointPage.routeName); },),
          ListTile(title: Text("Balance Page"), onTap: (){ Navigator.pushNamed(context, BalancePage.routeName); },),
          ListTile(title: Text("Friend Page"), onTap: (){ Navigator.pushNamed(context, FriendPage.routeName); },),
          ListTile(title: Text("UserAccount"), onTap: (){ Navigator.pushNamed(context, UserAccountPage.routeName); },),

          ListTile(title: Text("Login"), onTap: (){ Navigator.pushNamed(context, LandingPage.routeName); },),
          ListTile(title: Text("Register"), onTap: (){ Navigator.pushNamed(context, UserRegisterPage.routeName); },),

          ListTile(title: Text("Account"), onTap: (){ Navigator.pushNamed(context, AccountPage.routeName); },),
          ListTile(title: Text("Setting"), onTap: (){ Navigator.pushNamed(context, SettingPage.routeName); },),
          ListTile(title: Text("PaymentPage"), onTap: (){ Navigator.pushNamed(context, PaymentPage.routeName); },),
          ListTile(title: Text("MyTeamPage"), onTap: (){ Navigator.pushNamed(context, MyTeamPage.routeName); },),
          ListTile(title: Text("CalculatorPage"), onTap: (){ Navigator.pushNamed(context, CalculatorPage.routeName); },),
          ListTile(title: Text("WalletPage"), onTap: (){ Navigator.pushNamed(context, WalletPage.routeName); },),
          ListTile(title: Text("AboutUsPage"), onTap: (){ Navigator.pushNamed(context, AboutUsPage.routeName); },),
        ],
      ),
    );
  }

  void _login(){
    String email = "vocebe9500@nasskar.com";
    String password = "P@ssw0rd123";
    Provider.of<UserProvider>(context, listen:false).userLoginPlz(email: email, password: password);
  }

  // get currency conversation list
  void _getCurrency(){
    Provider.of<CryptoProvider>(context, listen:false).selectCryptoPlz(accessToken: "accessToken", page: 1, limit: 10, convert: "USD");
  }
  // get dashboard info
  void _getDashboard(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    Provider.of<DashboardProvider>(context, listen:false).getDashboardPlz(accessToken: accessToken);
  }
  // get referral list
  void _getReferralList(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    Provider.of<ReferralProvider>(context, listen:false).getReferralListPlz(accessToken: accessToken);
  }
  // get referral list
  void _getDepositAddressList(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    Provider.of<WalletProvider>(context, listen:false).getDepositAddressListPlz(accessToken: accessToken);
  }
  // get referral list
  void _getDepositTransactionList(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    Provider.of<WalletProvider>(context, listen:false).getDepositTransactionListPlz(accessToken: accessToken);
  }
  // get referral list
  void _getWithdrawTransactionList(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    Provider.of<WalletProvider>(context, listen:false).getWithdrawTransactionListPlz(accessToken: accessToken);
  }
  // get referral list
  void _requestDeposit(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    String link = "this is link";
    double depositAmount = 10.0;

    Provider.of<WalletProvider>(context, listen:false).requestDepositTransactionPlz(accessToken: accessToken, link: link, depositAmount: depositAmount);
  }
  // get referral list
  void _requestWithdraw(){
    String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5OTI1OTA2Zi00NjAwLTQyMzAtOTJlMS05OWIwZGQwYjRkYjMiLCJqdGkiOiJlMTM4MzU3M2I2MWY4ODMxMzU3ZDFmMzc5ZDkwNWQ0NzVmNzMwMGNiM2Y4MGY1ZWI2NWJjNjBiZTE3YTA4NDgxODhmOTY3ZTMxOTdhYjJhYSIsImlhdCI6MTY4OTMwMTAyOC44NDEzMjIsIm5iZiI6MTY4OTMwMTAyOC44NDEzMywiZXhwIjoxNzIwOTIzNDI4LjgzNzk5OCwic3ViIjoiMTQ1Iiwic2NvcGVzIjpbXX0.N38fOSNnYQLU4hoU5Gu-qr3chJOuc2qSW70W_QoWA8wL7wmtvtZ5BBvsdpnCRUTZygN4NcUMg14Qocpw0L3PlsSygaSwrTqRVgchBGft6JQE2x0jScpHHFOnuYWR7TvpNcg2ARtflS-dxYTj5WylUDkVAwwcXDcapZ0hXQ3Bwcl_e3EGmunFDc3-g2-ljVK9VuYSSn3aTK4jGdJBAyJqn4BsZJw2-SnwLTeraaCjX2urBFNRVs_ExWNs0IBKbfRB5RhglldFbeSwJ8gPgMuRZ1C_q77hea1z3BzxTgYLrF8zHmcVz5UeOtvgxJ6QS2yzH-AKM8H0vEyaF2sbYLnVqkM_jfBgyJsv4oumjCXycstRrIcV1ZDoHFKQ8ySot_yELhZl4paWX4Y-Gm44n6mnwuWECUC8-7-hkplhfgRhHjJDVfUldBQeDsSMh0wWNm221HE2BGc-i_EIebPRfaMqW-8p_18qRnFBeRV7oYM7OQP4KB3vssQm2zvw03FvH70QfuRcX4_OFnWDxSl2m7SFubyx9TofZwDJpS7EmttIfyLLZBuhGvlVl0qAHFypZpNJ0lDZPsWn30QKhJ5oKHQTgSzawcqAi2RSnfgsfGaeAIfs9-j0Zx5vS0sBCmPy8gz5ko3_Sbl5X3ULGyzUWXOCsNVL1yVOvL5sxKYCU2LZdkw";

    String withdrawAddress = "this is withdraw address";
    double withdrawAmount = 10.0;

    Provider.of<WalletProvider>(context, listen:false).requestWithdrawTransactionPlz(accessToken: accessToken, withdrawAddress: withdrawAddress, withdrawAmount: withdrawAmount);
  }

}
