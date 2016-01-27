/*globals Device, SMFSFManager, SFRestAPI, SMFSFRestDelegate , SMFSFAuthenticationManager, SMFSFRestRequest*/
//SalesForce Lib for Single iOS & Android Plugins

(function() {
    var SF = {};
    global.SF = SF;
    SF.connectedAppId = "Your app ID";
    SF.connectedAppCallbackUri = "sfdc://success";
    SF.authScopes = ["web", "api"];
    var activity = "Landroid/app/Activity;";
    SF.isActive = false;


    var setup = {
        iOS: function setup_iOS() {
            SF.manager = new SMFSFManager();
            SF.manager.connectedAppId = SF.connectedAppId;
            SF.manager.connectedAppCallbackUri = SF.connectedAppCallbackUri;
            SF.manager.authScopes = SF.authScopes;
            SF.launch = launch_iOS;
            SF.requestForQuery = requestForQuery_iOS;
            SF.logout = logout_iOS;
        },
        Android: function setup_Android() {
            SF.manager = new SMFSFManager();
            SF.manager.setConnectedAppId(SF.connectedAppId);
            SF.manager.setConnectedAppCallbackUri(SF.connectedAppCallbackUri);
            SF.manager.setAuthScopes(SF.authScopes);
            SF.launch = launch_Android;
            SF.requestForQuery = requestForQuery_Android;
            SF.logout = logout_Android;
        }
    };

    /**
     * Called after successful init
     * @callback postLaunchActionCallback
     */

    /**
     * Called after unsuccessful init
     * @callback launchErrorActionCallback
     * @param {string} e - Error info
     */

    /**
     * Initiates Salesforce plugin
     * @param {postLaunchActionCallback} postLaunchAction - Called after successful init
     * @param {launchErrorActionCallback} launchErrorAction - Called after a failure while initiating
     */
    function launch_iOS(postLaunchAction, launchErrorAction) {
        defaultPostLaunchAction.event = postLaunchAction;
        SF.manager.SMFPostLaunchAction = defaultPostLaunchAction;
        if (typeof launchErrorAction === "function")
            SF.manager.SMFLaunchErrorAction = launchErrorAction;
        if (SF.manager.preLaunch)
            SF.manager.preLaunch();
        SF.manager.launch();
    }

    /**
     * Initiates Salesforce plugin
     * @param {postLaunchActionCallback} postLaunchAction - Called after successful init
     * @param {launchErrorActionCallback} launchErrorAction - Called after a failure while initiating
     */
    function launch_Android(postLaunchAction, launchErrorAction) {
        defaultPostLaunchAction.event = postLaunchAction;
        SF.manager.SMFPostLaunchAction = defaultPostLaunchAction;
        if (typeof launchErrorAction === "function")
            SF.manager.SMFLaunchErrorAction = launchErrorAction;
        SF.manager.launch(activity);
    }

    function defaultPostLaunchAction(e) {
        SF.isActive = true;
        if (typeof defaultPostLaunchAction.event === "function") {
            defaultPostLaunchAction.event.call(SF, e);
        }
    }

    function checkSFActive() {
        if (!SF.isActive) {
            throw Error("SalesForce SDK is not logged in");
        }
    }

    /**
     * Called after successful query result
     * @callback onSuccessQuery
     * @param {object} e - Response object
     */

    /**
     * Called after unsuccessful query result
     * @callback onFailureQuery
     * @param {object} e - Error object
     */

    /**
     * Performs query to rest services
     * @param {object} query - Query object
     * @param {onSuccessQuery} onSuccess - Called after recieving successfult response from service
     * @param {onFailureQuery} onFailure - Called after having problem while calling the service
     */
    function requestForQuery_iOS(query, onSuccess, onFailure) {
        checkSFActive();
        var restApi = SFRestAPI.sharedInstance();
        var restRequest;
        if (typeof query === "string")
            restRequest = restApi.requestForQuery(query);
        else if (query instanceof Array) {
            //Object needs to be strigified before passed as dictionary
            query[2] = JSON.stringify(query[2]);
            restRequest = SMFSFRestRequest.requestPathParamsEnd.apply(SMFSFRestRequest, query);
        }
        else {
            throw Error("invalid query type");
        }

        var reqDelegate = new SMFSFRestDelegate();

        if (typeof onSuccess === "function") {
            reqDelegate.onSuccess = onSuccess;
        }
        if (typeof onFailure === "function") {
            reqDelegate.onFail = onFailure;
        }
        restApi.sendDelegate(restRequest, reqDelegate);
    }

    /**
     * Performs query to rest services
     * @param {object} query - Query object
     * @param {onSuccessQuery} onSuccess - Called after recieving successfult response from service
     * @param {onFailureQuery} onFailure - Called after having problem while calling the service
     */
    function requestForQuery_Android(query, onSuccess, onFailure) {
        function onSuccessParser(e) {
            if (typeof onSuccess == "function") {
                var result = JSON.parse(e);
                onSuccess(result);
            }
        }

        function onFailureParse(e) {
            if (typeof onFailure === "function") {
                var result = JSON.parse(e);
                onFailure(result);
            }
        }
        checkSFActive();
        var sfClient = SF.manager;

        sfClient.onSuccess = onSuccessParser;
        sfClient.onFail = onFailureParse;
        if (typeof query === "string") {
            if (typeof onSuccess === "function") {
                sfClient.onSuccess = onSuccess;
            }
            sfClient.requestForQuery(query);
        }
        else if (query instanceof Array) {
            query[2] = JSON.stringify(query[2]);
            var query2 = [query[0], query[3] + query[1], query[2]];
            sfClient.requestForRest.apply(sfClient, query2);
        }
    }

    /**
     * Called after logging out
     * @callback logoutCallback
     */

    /**
     * Performs logout from salesforce
     * @param {logoutCallback} callback - Called after performing logout operation
     */
    function logout_iOS(callback) {
        var accMan = new SMFSFAuthenticationManager();
        accMan.addDelegate(accMan);
        accMan.logout();
        if (typeof callback === "function") {
            callback.call(SF);
        }
    }

    /**
     * Performs logout from salesforce
     * @param {logoutCallback} callback - Called after performing logout operation
     */
    function logout_Android(callback) {
        if (typeof callback === "function") {
            SF.manager.SMFPostLogoutAction = callback;
        }
        SF.manager.logout(activity);
    }
    setup[Device.deviceOS]();

})();