package com.example.lyric_lingo
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.Log
import com.spotify.sdk.android.auth.AuthorizationClient
import com.spotify.sdk.android.auth.AuthorizationRequest
import com.spotify.sdk.android.auth.AuthorizationResponse

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.lyric_lingo"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        authenticateConnectionSpotify()
    }
    
    private fun authenticateConnectionSpotify(): Boolean {

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "authenticate") {
                val clientId = call.argument<String>("clientId")
                val clientSecret = call.argument<String>("clientSecret")
                val redirectUri = "lyriclingoapp://main";
                if (clientId != null && clientSecret != null) {
                    val buildRequest = AuthorizationRequest.Builder(
                        clientId,
                        AuthorizationResponse.Type.TOKEN,
                        redirectUri,
                    )
                    buildRequest.setScopes(arrayOf("streaming"))
                    val logInUser = buildRequest.build()
                    AuthorizationClient.openLoginInBrowser(this, logInUser)
                    result.success("Success!")
                } else {
                    result.error("Error!", "Not working!", null)
                }
            }
        }
        return true;
    }
    private fun logInUser(clientId: String,redirectUri: String): Boolean {
        val builder = AuthorizationRequest.Builder(
            clientId,
            AuthorizationResponse.Type.TOKEN,
            redirectUri,
        )
        builder.setScopes(arrayOf("streaming"))
        val request = builder.build()
        AuthorizationClient.openLoginInBrowser(this, request)
        return true;
    }
}      
                

