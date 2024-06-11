package com.techno.twilio.twilio

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat.startActivity
import com.techno.twilio.twilio.VideoActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.os.Bundle
import androidx.annotation.Nullable

/** TwilioPlugin */
class TwilioPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity
    private lateinit var context: Context
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "twilio")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.getApplicationContext();

    }

    override fun onAttachedToActivity(flutterPluginBinding: ActivityPluginBinding) {
        activity = flutterPluginBinding.getActivity();
    }

    override fun onReattachedToActivityForConfigChanges(flutterPluginBinding: ActivityPluginBinding) {
        this.activity = flutterPluginBinding.getActivity()
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onDetachedFromActivity() {
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            println("getPlatformVersion :${call.argument<String>("twilioAuthToken")}")
            //result.success("Android ${android.os.Build.VERSION.RELEASE}")
            val intent = Intent(this.context, VideoActivity::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            intent.putExtra("twilioAuthToken",call.argument<String>("twilioAuthToken"))
            intent.putExtra("practitionerName",call.argument<String>("practitionerName"))
            startActivity(this.context, intent, null)

        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}