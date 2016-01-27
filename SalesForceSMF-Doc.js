if (Device.deviceOS === "IDE") {
	
	/**
	 * Creates a new instance of SMFSFManager object
	 * @example
	 * var smfSfmanager = new SMFSFManager();
	 */
	function SMFSFManager() {}
	global.SMFSFManager = SMFSFManager;
	

	/**
 	 */
 	SMFSFManager.preLaunch = function preLaunch() {};

	/**
 	 */
 	SMFSFManager.launch = function launch() {};
 	
	/**
     	* @property {string|number}
     	*/
	SMFSFManager.prototype.connectedAppId = "";
	
	/**
     	* @property {string|number}
     	*/
	SMFSFManager.prototype.connectedAppCallbackUri = "";
	
	/**
	@property {array}
     	*/
	SMFSFManager.prototype.authScopes = [];


	/**
     	*/
	SMFSFManager.prototype.SMFPostLaunchAction = function() {};

	/**
     	*/
	SMFSFManager.prototype.SMFLaunchErrorAction = function() {};



	

	function SFRestAPI() {}
	global.SFRestAPI = SFRestAPI;

	/**
	* Get the shared instance of the SFRestAPI for iOS class.
	* @static
	* @method sharedInstance
	* @return {SFRestAPI} instance.
	*/
	SFRestAPI.sharedInstance = function sharedInstance() {};

	SFRestAPI.requestForQuery = 	function(query) {};
	SFRestAPI.sendDelegate = function(restRequest,reqDelegate) {};


	
	function SFRestRequest() {}
	global.SFRestRequest = SFRestRequest;


	function SMFSFRestRequest() {}
	global.SMFSFRestRequest = SMFSFRestRequest;
	SMFSFRestRequest.requestPathParams = function(method,path,params) {};


	function SMFSFRestDelegate() {}
	global.SMFSFRestDelegate = SMFSFRestDelegate;

	SMFSFRestDelegate.prototype.onSuccess = function(e) {};
	SMFSFRestDelegate.prototype.onFail = function(e) {};

	function SFUserAccountManager() {}
	global.SFUserAccountManager = SFUserAccountManager;

	function SMFSFAuthenticationManager() {}
	global.SMFSFAuthenticationManager = SMFSFAuthenticationManager;
	SMFSFAuthenticationManager.addDelegate = function addDelegate(delegate) {};
	SMFSFAuthenticationManager.logout = function logout() {};
}