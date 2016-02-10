# Smartface Salesforce plugin for iOS

This is Smartface Salesforce plugin based on SalesForce Native iOS SDK. You can use this plugin on Smartface IDE and Smartface Cloud Development portal.

#ScreenShots

<img src="http://i.imgur.com/LazEaOx.png">
----------
<img src="http://i.imgur.com/cbRNAhx.png">

#Features

* Authentication with Webview.
* Using SalesforceRestAPI.


# Plugin Initialization for Smartface

You can download plugin project and you can create a plugin zip file to use on smartface by doing steps in  [Smartface.io](http://www.smartface.io/developer/guides/plugins/developing-smartface-plugins/)
* You can use SalesForceSMF-Doc.js(autocomplete file) by including into Global.js file in your smartface project.

# Usage on Smartface

You can authenticate with Salesforce and You can send request. Example ;

```javascript

var SFSDKManager = new SMFSFManager();

    SFSDKManager.connectedAppId = "3MVG9FS3IyroMOh4nubHUj9SXAs1i6qwY8KhK6bsE6WmX3g9vrNsjA1CGgUjDpXjoxa0YKSF0kyxUh0scH3fn"; /*** salesforce.com daki olusturdugunuz appId - string ***/
    //"3MVG9KI2HHAq33Rxa66R9QnuzX1mjp4o.jTY4owVtxO7IqWmudjw7Q8m8xfNwN2t1nkSmUy1DU0mwAH9Urry7";


    SFSDKManager.connectedAppCallbackUri = "sfdc://success"; /*** salesforce.com daki olusturdugunuz app callback url - string ***/


    SFSDKManager.authScopes = ["web", "api"];


    SFSDKManager.SMFPostLaunchAction = function(e) {

        /**** after login action is successful ****/

        sendRequest();

    };


    SFSDKManager.launch();



    function sendRequest() {

        /*** In SF account, it gets first 10 users and with recieved response it alerts the first user name ***/

        var limit = 100;
        var restApi = SFRestAPI.sharedInstance();




        var reqDelegate = new SMFSFRestDelegate();


        reqDelegate.onSuccess = function(e) {
            var names = [];
            for (var i = 0; i < limit; i++) {
                try {
                    names.push(e.records[0].Name);
                }
                catch (exx) {
                    break;
                }
            }
            alert(names.join("\n"));
        }


        restApi.sendDelegate(restRequest, reqDelegate);

    }

```
You can find more example usage about properties and functions in sf.js file.

# Requirements



# Author
 Smartface

# License
Smartface SalesForce iOS Plugin is used SalesForce SDK. You can check LICENSE.md





