package tech.shmy.qbkj_mob

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import tech.shmy.qbkj_mob.view.banner.BannerViewFactory
import tech.shmy.qbkj_mob.view.feed.FeedViewFactory
import tech.shmy.qbkj_mob.view.splash.SplashViewFactory

/** QbkjMobPlugin */
class QbkjMobPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    QBKJ.context = flutterPluginBinding.applicationContext;
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, Constant.methodChannel)
    channel.setMethodCallHandler(this)
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
    if (call.method == Constant.initAd) {
      QBKJ.initAd(call.argument<String>("id").toString(), result)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
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
