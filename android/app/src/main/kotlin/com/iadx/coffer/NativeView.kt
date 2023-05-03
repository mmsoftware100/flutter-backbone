package com.iadx.coffer

import android.content.Context
import android.graphics.Color
import android.net.Uri
import android.util.Log
import android.view.View
import android.webkit.*
import android.widget.LinearLayout
import android.widget.TextView
import androidx.webkit.ProxyConfig
import androidx.webkit.ProxyController
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import java.util.concurrent.Executor

// TODO
// Need to pass following data
/**
 * web url
 * proxy url
 * proxy port
 * proxy username
 * proxy password
 */

/**
 * Callback Function
 * url changed
 */

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?, dartChannel: MethodChannel) : PlatformView {
    // private val textView: TextView
    private var webView: WebView
    // private var linearLayout: LinearLayout

    private val TAG = "iCofferWebAndroid"
    private val CHANNEL = "samples.flutter.dev/battery"
    private var status = 0;
    private var auth_count = 0;
    // private lateinit var dartChannel: MethodChannel

    override fun getView(): View {
        Log.v(TAG, "NativeView->getView");
        // return webView
        return webView
    }

    override fun dispose() {}
    fun dispose2() {
        Log.v(TAG, "NativeView->dispose");
        // linearLayout.removeAllViews()
        webView.clearHistory();

        // NOTE: clears RAM cache, if you pass true, it will also clear the disk cache.
        // Probably not a great idea to pass true if you have other WebViews still alive.
        webView.clearCache(true);

        // Loading a blank page is optional, but will ensure that the WebView isn't doing anything when you destroy it.
        webView.loadUrl("about:blank");

        webView.onPause();
        webView.removeAllViews();

        // NOTE: This pauses JavaScript execution for ALL WebViews,
        // do not use if you have other WebViews still alive.
        // If you create another WebView after calling this,
        // make sure to call mWebView.resumeTimers().
        webView.pauseTimers();

        // NOTE: This can occasionally cause a segfault below API 17 (4.2)
        webView.destroy();

        // Null out the reference so that you don't end up re-using it.
        // webView = null;
    }

    init {
        Log.v(TAG, "NativeView->init");

        /* Connect to Dart */
        /*
        dartChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL);


         */

        webView = WebView(context)
        //linearLayout = LinearLayout(context)
        //linearLayout.addView(webView)

        /*
        textView.textSize = 72f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "Rendered on a native Android view (id: $id)"

         */
        webView.getSettings().setJavaScriptEnabled(true)
        webView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true)
        // webView.getSettings().databaseEnabled(true)
        // webView.webViewClient = WebViewClient()

        val newUA = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.4) Gecko/20100101 Firefox/4.0"
        webView.getSettings().setUserAgentString(newUA)
        Log.i("WEB_VIEW_TEST", "user agent :$newUA")

        val proxy_username: String = creationParams?.get("proxy_username") as String
        val proxy_password: String = creationParams?.get("proxy_password") as String
        val proxy_username_backup: String = creationParams?.get("proxy_username_backup") as String
        val proxy_password_backup: String = creationParams?.get("proxy_password_backup") as String


        val url: String = creationParams?.get("url") as String  //['url'] ? "https://google.com";
        webView.webViewClient = object : WebViewClient() {
            // on received error
            override fun onReceivedError(
                view: WebView?,
                errorCode: Int,
                description: String?,
                failingUrl: String?
            ) {
                Log.i("WEB_VIEW_TEST", "error code:$errorCode")

                Log.v(TAG, "onReceivedError->$failingUrl");
                if (description != null) {
                    Log.v(TAG, description)
                };
                Log.v(TAG, errorCode.toString())

                dartChannel.invokeMethod("error", errorCode)
                if(errorCode == -11 || errorCode == -1) {
                    Log.v(TAG, "changed to device ip")
                    clearProxy(url)
                    // webView.loadUrl(url)
                }
                super.onReceivedError(view, errorCode, description, failingUrl)
            }

            override fun onReceivedHttpAuthRequest(
                view: WebView?,
                handler: HttpAuthHandler,
                host: String?,
                realm: String?
            ) {
                // handler.proceed("mgtrick1", "htethtetaung13")
                Log.v(TAG, "onReceivedHttpAuthRequest-> auth_count $auth_count");
                if(auth_count == 0 ) {
                    Log.v(TAG, "onReceivedHttpAuthRequest-> $proxy_username and $proxy_password");
                    handler.proceed(proxy_username, proxy_password)
                }
                else{
                    Log.v(TAG, "onReceivedHttpAuthRequest-> clearProxy");
                    clearProxy(url);
                    dartChannel.invokeMethod("error", -11)
                }
                auth_count++
            }

            // progress changed

            override fun shouldOverrideUrlLoading(
                view: WebView?,
                request: WebResourceRequest?
            ): Boolean {
                val url: Uri? = request?.url;
                val newUrl: String = url.toString()
                Log.v(TAG, "shouldOverrideUrlLoading->$newUrl");

                dartChannel.invokeMethod("foo", newUrl)
                Log.v(TAG, "dartChannel.invokeMethod success")
                return super.shouldOverrideUrlLoading(view, request)
            }


        }

        webView.webChromeClient = object : WebChromeClient() {
            override fun onProgressChanged(view: WebView?, progress: Int) {
                Log.v(TAG, "onProgressChanged->$progress");
                dartChannel.invokeMethod("bar", progress)

            }

        }

        val proxy_host: String = creationParams?.get("proxy_host") as String
        val proxy_port: String = creationParams?.get("proxy_port") as String
        val proxy_url = "$proxy_host:$proxy_port"

         setProxy(proxy_url, url)

        // webView.loadUrl("https://icoffer.top/api/v1/ip")
        // webView.loadUrl("https://google.com")
        // webView.loadUrl(url)

        //Log.v(TAG, "webView.loadUrl->$url");
    }

    private fun setProxy(proxyUrl: String, url: String) {

        Log.v(TAG, "setProxy->$proxyUrl");
        // clear first
        ProxyController.getInstance().clearProxyOverride( object : Executor {
            override fun execute(command: Runnable?) {
                //do nothing
                Log.v(TAG, "setProxy->cleared");
                Log.v(TAG, "ProxyController.getInstance().clearProxyOverride()->execute ");
                // override
                val proxyConfig: ProxyConfig = ProxyConfig.Builder()
                    // .addProxyRule("123.123.123.123:1234")
                    //.addProxyRule("45.192.136.51:5345")
                    .addProxyRule(proxyUrl)
                    .addDirect().build()

                ProxyController.getInstance().setProxyOverride(proxyConfig, object : Executor {
                    override fun execute(command: Runnable?) {
                        //do nothing
                        Log.v(TAG, "setProxy->setProxyOverride");
                        Log.v(TAG, "ProxyController.getInstance().setProxyOverride()->execute ");
                        Log.v(TAG, "setProxy->loadURl");
                        webView.loadUrl(url)
                    }
                }, Runnable { })
            }
        }, Runnable { });
    }

    private fun clearProxy(url: String) {
        Log.v(TAG, "clearProxy");
        ProxyController.getInstance().clearProxyOverride( object : Executor {
            override fun execute(command: Runnable?) {
                //do nothing

                Log.v(TAG, "clearProxy->cleared, Now, time for loading");
                webView.loadUrl(url)
            }
        }, Runnable { });
        /*
        val proxyConfig: ProxyConfig = ProxyConfig.Builder()
            // .addProxyRule("123.123.123.123:1234")
            //.addProxyRule("45.192.136.51:5345")
            // .addProxyRule(proxyUrl)
            .addDirect().build()
        ProxyController.getInstance().setProxyOverride(proxyConfig, object : Executor {
            override fun execute(command: Runnable?) {
                //do nothing
            }
        }, Runnable { })

         */
    }


}



// if proxy error,
// clear proxy and reload
/*
if(errorCode == -11 && status == 1){
    Log.v(TAG, "changed to backup proxy")
    // chanage status to 0
    status = 0;
    // clear proxy
    clearProxy();
    // set backup proxy
    val proxy_host: String = creationParams?.get("proxy_host_backup") as String
    val proxy_port: String = creationParams?.get("proxy_port_backup") as String
    val proxy_url = "$proxy_host:$proxy_port"

    webView.setWebViewClient(object : WebViewClient() {
        override fun onReceivedHttpAuthRequest(
            view: WebView?,
            handler: HttpAuthHandler,
            host: String?,
            realm: String?
        ) {
            // handler.proceed("mgtrick1", "htethtetaung13")
            Log.v(TAG, "onReceivedHttpAuthRequest for backup-> $proxy_username_backup and $proxy_password_backup");
            handler.proceed(proxy_username, proxy_password)
        }
    })
    setProxy(proxy_url)
    webView.loadUrl(url)
}

 */