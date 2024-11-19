package com.example.lyric_lingo
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.Log
import com.spotify.sdk.android.auth.AuthorizationClient
import com.spotify.sdk.android.auth.AuthorizationRequest
import com.spotify.sdk.android.auth.AuthorizationResponse
import android.content.Intent

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.lyric_lingo"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        authenticateConnectionSpotify()
    }
    
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        val response = AuthorizationClient.getResponse(resultCode, data)

        if (response.type == AuthorizationResponse.Type.TOKEN) {
            val accessToken = response.accessToken

            // Save the access token securely
            val sharedPreferences = getSharedPreferences("spotify_prefs", MODE_PRIVATE)
            val editor = sharedPreferences.edit()
            editor.putString("access_token", accessToken)
            editor.apply()

            Log.d("SpotifyAuth", "Access token saved successfully!")
        } else if (response.type == AuthorizationResponse.Type.ERROR) {
            Log.e("SpotifyAuth", "Authorization error: ${response.error}")
        }
    }

    private fun authenticateConnectionSpotify(): Boolean {

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "authenticate" -> {
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
                        result.error("Error!", "Not working!", null)}
                }

                "getAccessToken" -> {
                    val sharedPreferences = getSharedPreferences("spotify_prefs", MODE_PRIVATE)
                    val accessToken = sharedPreferences.getString("access_token", null)
                    if (accessToken != null) {
                        result.success(accessToken)
                    } else {
                        result.error("Error", "Access token not found!", null)
                    }
                }

            }
    
            }
            return true;
        }
    }
     
                

