package tech.shmy.qbkj_mob

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tech.shmy.qbkj_mob.view.banner.BannerViewFactory
import tech.shmy.qbkj_mob.view.feed.FeedViewFactory
import tech.shmy.qbkj_mob.view.splash.SplashViewFactory

/** QbkjMobPlugin */
class QbkjMobPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var methodChannel: MethodChannel
    private lateinit var binaryMessenger: BinaryMessenger

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        QBKJ.context = flutterPluginBinding.applicationContext
        binaryMessenger = flutterPluginBinding.binaryMessenger
        methodChannel = MethodChannel(binaryMessenger, Constant.methodChannel)

        methodChannel.setMethodCallHandler(this)
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.bannerAdView,
            BannerViewFactory(binaryMessenger)
        )
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.splashAdView,
            SplashViewFactory(binaryMessenger)
        )
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.feedAdView,
            FeedViewFactory(binaryMessenger)
        )
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            Constant.initAd -> {
                QBKJ.initAd(call.argument<String>("id").toString(), result)
            }
            Constant.insertAd -> {
                QBKJ.insertAd(call.argument<String>("id").toString(), binaryMessenger, result)
            }
            Constant.rewardAd -> {
                QBKJ.rewardAd(call.argument<String>("id").toString(), call.argument<String>("userId").toString(), binaryMessenger, result)
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        QBKJ.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
    }

}
