package tech.shmy.qbkj_mob

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.widget.LinearLayout
import com.tb.mob.TbManager
import com.tb.mob.TbManager.InteractionLoadListener
import com.tb.mob.bean.RewardPosition
import com.tb.mob.config.TbInitConfig
import com.tb.mob.config.TbInteractionConfig
import com.tb.mob.config.TbRewardVideoConfig
import io.flutter.plugin.common.MethodChannel


@SuppressLint("StaticFieldLeak")
object QBKJ {
    lateinit var activity: Activity
    lateinit var context: Context
    fun getEmptyContainer(): LinearLayout {
        val layoutParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.MATCH_PARENT
        )
        val container = LinearLayout(context)
        container.layoutParams = layoutParams
        return container
    }

    fun initAd(appId: String, result: MethodChannel.Result) {
//        RequestPermission.RequestPermissionIfNecessary(activity);
        val config: TbInitConfig = TbInitConfig.Builder()
            .appId(appId) //初始化id（平台上申请：应用列表的应用id）
            .build()

        TbManager.init(context, config, object : TbManager.IsInitListener {
            override fun onFail(s: String?) {
                result.success(false)
            }

            override fun onSuccess() {
                result.success(true)
            }
        })
        result.success(true)
    }

    fun insertAd(adCode: String, queuingEventSink: QueuingEventSink) {
        val config = TbInteractionConfig.Builder()
            .codeId(adCode) //平台申请的代码位id
            .orientation(TbManager.Orientation.VIDEO_VERTICAL) //必填参数，期望视频的播放方向：VIDEO_HORIZONTAL 或 VIDEO_VERTICAL
            .build()
        TbManager.loadInteraction(config, activity, object : InteractionLoadListener {
            override fun onFail(s: String) {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.insertAd,
                        "event" to "onError",
                    )
                )
            }

            override fun getSDKID(p0: Int?, p1: String?) {
            }

            override fun onClicked() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.insertAd,
                        "event" to "onClick",
                    )
                )
            }

            override fun onExposure() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.insertAd,
                        "event" to "onShow",
                    )
                )
            }

            override fun onDismiss() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.insertAd,
                        "event" to "onDismiss",
                    )
                )
            }

            override fun onVideoReady() {}
            override fun onVideoComplete() {}
        })
    }

    fun rewardAd(adCode: String, userId: String, queuingEventSink: QueuingEventSink) {
        val config = TbRewardVideoConfig.Builder()
            .codeId(adCode) //平台申请的代码位id
            .userId(userId) //必填参数，用户ID或者设备唯一标识（服务器回调时也需要）
//            .callExtraData("extraData") //服务器回调额外信息（可不填）
            .playNow(true) //是否立即播放
            .orientation(TbManager.Orientation.VIDEO_VERTICAL) //必填参数，期望视频的播放方向：VIDEO_HORIZONTAL 或 VIDEO_VERTICAL
            .build()
        TbManager.loadRewardVideo(config, activity, object: TbManager.RewardVideoLoadListener {
            override fun getSDKID(p0: Int?, p1: String?) {
            }

            override fun onClick() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.rewardAd,
                        "event" to "onClick",
                    )
                )
            }

            override fun onExposure(p0: String?) {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.rewardAd,
                        "event" to "onShow",
                    )
                )
            }

            override fun onRewardVideoCached(p0: RewardPosition?) {
            }

            override fun onSkippedVideo() {

            }

            override fun onFail(p0: String?) {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.rewardAd,
                        "event" to "onError",
                    )
                )
            }

            override fun onClose() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.rewardAd,
                        "event" to "onDismiss",
                    )
                )
            }

            override fun onRewardVerify() {
                queuingEventSink.success(
                    mapOf(
                        "type" to Constant.rewardAd,
                        "event" to "onReward"
                    )
                )
            }

        })
    }
}