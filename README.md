# Smartface Salesforce plugin for iOS

This is Smartface Salesforce plugin based on SalesForce Native iOS SDK. You can use this plugin on Smartface IDE and Smartface Cloud Development portal.

#ScreenShots

<img src="http://i.imgur.com/LazEaOx.png">
----------
<img src="http://i.imgur.com/cbRNAhx.png">

#Features

* Authentication with Webview.
* Using SalesforceRestAPI.

#### Contructor
You can create SalesForce Manager Constructor as ;
```javascript
var SFSDKManager = new SMFSFManager();
```

#### Set ConnectedAppId Property
ConnectedAppId is a value that Salesforce created for you to use in app.
```javascript
    SFSDKManager.connectedAppId = "3MVG9FS3IyroMOh4nubHUj9SXAs1i6qwY8KhK6bsE6WmX3g9vrNsjA1CGgUsdasdasdfdsfsdfsdfqqww";
```

#### Set connectedAppCallbackUri Property
ConnectedAppCallbackUri is a uri that Salesforce uses for communication.
```javascript
    SFSDKManager.connectedAppCallbackUri = "test://test"; 
```

#### Set authScopes Property
AuthScopes is an array that includes what the application will use.

```Javascript
    SFSDKManager.authScopes = ["web", "api"];
```

#### launch Function
This will show webview to authenticate with User email and Password.

```Javascript
    SFSDKManager.launch();
```

#### SMFPostLaunchAction Event
After logging successfully this event will be triggered.
```Javascript
    SFSDKManager.SMFPostLaunchAction = function(e) {
        /**** after login action is successful ****/
    };
```

#### SMFLaunchErrorAction Event
If there is an error while authenticating ;
```Javascript
    SFSDKManager.SMFLaunchErrorAction = function(e) {
        /****  when authentication error occurs ****/
    };
```

#### SFRestAPI Object
SFRestApi is used to send request and to get response with delegate methods. You can call sharedInstance as;
```Javascript
    var restApi = SFRestAPI.sharedInstance();
```

#### SFRestRequest Object
You can use this class as request object. SFRestAPI creates SFRestRequest object as ;
```Javascript
    var restRequest = restApi.requestForQuery(query);
```

#### SMFSFRestDelegate Object
Events are handled with this class methods. You can create as ;
```Javascript
var reqDelegate = new SMFSFRestDelegate();
```

#### SMFSFRestDelegate onSuccess Event
This event is trigerred after a successfull request ;
```Javascript
    reqDelegate.onSuccess = function(e) {
    
    }
```

#### SMFSFRestDelegate onFail Event
If there is an error after request ;
```Javascript
    reqDelegate.onFail = function(e) {
    
    }
```

#### SFRestAPI sendDelegate Method
You can send request by this method. Takes two parameters request and delegate
```Javascript
    restApi.sendDelegate(restRequest, reqDelegate);
```


# Plugin Initialization for Smartface

You can download plugin project and you can create a plugin zip file to use on smartface by doing steps in  [Smartface.io](http://www.smartface.io/developer/guides/plugins/developing-smartface-plugins/)
* You can use SalesForceSMF-Doc.js(autocomplete file) by including into Global.js file in your smartface project.

# Usage on Smartface

You can authenticate with Salesforce and You can send request. Example ;

```javascript

var SFSDKManager = new SMFSFManager();

    SFSDKManager.connectedAppId = "3MVG9FS3IyroMOh4nubHUj9SXAs1i6qwY8KhK6bsE6WmX3g9vrNsjA1CGgUsdasdasdfdsfsdfsdfqqww";

    SFSDKManager.connectedAppCallbackUri = "test://test"; 

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
 Smartface inc.

# License
Smartface SalesForce iOS Plugin used SalesForce SDK. You can check LICENSE.md





