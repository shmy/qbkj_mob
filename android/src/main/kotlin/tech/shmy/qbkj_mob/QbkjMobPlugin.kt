package tech.shmy.qbkj_mob

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tech.shmy.qbkj_mob.view.banner.BannerViewFactory
import tech.shmy.qbkj_mob.view.feed.FeedViewFactory
import tech.shmy.qbkj_mob.view.splash.SplashViewFactory

/** QbkjMobPlugin */
class QbkjMobPlugin : FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private val queuingEventSink: QueuingEventSink = QueuingEventSink()

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        QBKJ.context = flutterPluginBinding.applicationContext;
        methodChannel = MethodChannel(flutterPluginBinding.binaryMessenger, Constant.methodChannel)
        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, Constant.eventChannel);

        methodChannel.setMethodCallHandler(this)
        eventChannel.setStreamHandler(this)
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.bannerAdView,
            BannerViewFactory(flutterPluginBinding.binaryMessenger)
        );
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.splashAdView,
            SplashViewFactory(flutterPluginBinding.binaryMessenger)
        );
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            Constant.feedAdView,
            FeedViewFactory(flutterPluginBinding.binaryMessenger)
        );
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            Constant.initAd -> {
                QBKJ.initAd(call.argument<String>("id").toString(), result)
            }
            Constant.insertAd -> {
                QBKJ.insertAd(call.argument<String>("id").toString(), queuingEventSink)
            }
            Constant.rewardAd -> {
                QBKJ.rewardAd(call.argument<String>("id").toString(), call.argument<String>("userId").toString(), queuingEventSink)
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

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        queuingEventSink.setDelegate(events)
    }

    override fun onCancel(arguments: Any?) {
        queuingEventSink.setDelegate(null)
    }
}
