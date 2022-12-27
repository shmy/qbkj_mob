package tech.shmy.qbkj_mob

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.widget.FrameLayout
import com.tb.mob.TbManager
import com.tb.mob.TbManager.InteractionLoadListener
import com.tb.mob.bean.RewardPosition
import com.tb.mob.config.TbInitConfig
import com.tb.mob.config.TbInteractionConfig
import com.tb.mob.config.TbRewardVideoConfig
import com.tb.mob.utils.RequestPermission
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


@SuppressLint("StaticFieldLeak")
object QBKJ {
    lateinit var activity: Activity
    lateinit var context: Context
    private var insertAdId = -1
    private var rewardAdId = -1
    fun getEmptyContainer(): FrameLayout {
        val layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        val container = FrameLayout(context)
        container.layoutParams = layoutParams
        return container
    }

    fun initAd(appId: String, result: MethodChannel.Result) {
        RequestPermission.RequestPermissionIfNecessary(activity);
        val config: TbInitConfig = TbInitConfig.Builder()
            .appId(appId) //初始化id（平台上申请：应用列表的应用id）
            .build()

        TbManager.init(context, config, object : TbManager.IsInitListener {
            override fun onFail(s: String?) {
//                result.success(false)
            }

            override fun onSuccess() {
//                result.success(true)
            }
        })
        result.success(true)
    }

    fun insertAd(adCode: String, binaryMessenger: BinaryMessenger, result: MethodChannel.Result) {
        val config = TbInteractionConfig.Builder()
            .codeId(adCode) //平台申请的代码位id
            .orientation(TbManager.Orientation.VIDEO_VERTICAL) //必填参数，期望视频的播放方向：VIDEO_HORIZONTAL 或 VIDEO_VERTICAL
            .build()
        insertAdId ++
        val eventChannel = EventChannel(binaryMessenger, "insertAdEvent_$insertAdId")
        var eventSink: EventChannel.EventSink? = null
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler{
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }

        })
        result.success(insertAdId)

        TbManager.loadInteraction(config, activity, object : InteractionLoadListener {
            override fun onFail(s: String) {
                eventSink?.success(
                    mapOf(
                        "event" to "onError",
                    )
                )
                eventSink?.endOfStream()
            }

            override fun getSDKID(p0: Int?, p1: String?) {
            }

            override fun onClicked() {
                eventSink?.success(
                    mapOf(
                        "event" to "onClick",
                    )
                )
            }

            override fun onExposure() {
                eventSink?.success(
                    mapOf(
                        "event" to "onShow",
                    )
                )
            }

            override fun onDismiss() {
                eventSink?.success(
                    mapOf(
                        "event" to "onDismiss",
                    )
                )
                eventSink?.endOfStream()
            }

            override fun onVideoReady() {}
            override fun onVideoComplete() {}
        })
    }

    fun rewardAd(adCode: String, userId: String, binaryMessenger: BinaryMessenger, result: MethodChannel.Result) {
        val config = TbRewardVideoConfig.Builder()
            .codeId(adCode) //平台申请的代码位id
            .userId(userId) //必填参数，用户ID或者设备唯一标识（服务器回调时也需要）
//            .callExtraData("extraData") //服务器回调额外信息（可不填）
            .playNow(true) //是否立即播放
            .orientation(TbManager.Orientation.VIDEO_VERTICAL) //必填参数，期望视频的播放方向：VIDEO_HORIZONTAL 或 VIDEO_VERTICAL
            .build()
        rewardAdId ++

        val eventChannel = EventChannel(binaryMessenger, "rewardAdEvent_$rewardAdId")
        var eventSink: EventChannel.EventSink? = null
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler{
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
            }

        })
        result.success(rewardAdId)
        TbManager.loadRewardVideo(config, activity, object : TbManager.RewardVideoLoadListener {
            override fun getSDKID(p0: Int?, p1: String?) {
            }

            override fun onClick() {
                eventSink?.success(
                    mapOf(
                        "event" to "onClick",
                    )
                )
            }

            override fun onExposure(p0: String?) {
                eventSink?.success(
                    mapOf(
                        "event" to "onShow",
                    )
                )
            }

            override fun onRewardVideoCached(p0: RewardPosition?) {
            }

            override fun onSkippedVideo() {
                eventSink?.success(
                    mapOf(
                        "event" to "onSkip",
                    )
                )
            }

            override fun onFail(p0: String?) {
                eventSink?.success(
                    mapOf(
                        "event" to "onError",
                    )
                )
                eventSink?.endOfStream()
            }

            override fun onClose() {
                eventSink?.success(
                    mapOf(
                        "event" to "onDismiss",
                    )
                )
                eventSink?.endOfStream()
            }

            override fun onRewardVerify() {
                eventSink?.success(
                    mapOf(
                        "event" to "onReward"
                    )
                )
            }

        })
    }
}