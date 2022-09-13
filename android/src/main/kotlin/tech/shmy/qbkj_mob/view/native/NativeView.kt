package tech.shmy.qbkj_mob.view.native

import tech.shmy.qbkj_mob.Constant
import android.view.View
import android.widget.LinearLayout
import com.tb.mob.TbManager
import com.tb.mob.bean.FeedPosition
import com.tb.mob.config.TbFeedConfig
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import tech.shmy.qbkj_mob.QBKJ


class NativeView(
    messenger: BinaryMessenger,
    id: Int,
    creationParams: Map<String?, Any?>?
) : PlatformView {
    private val container: LinearLayout = QBKJ.getEmptyContainer()
    private var methodChannel: MethodChannel? =
        MethodChannel(messenger, Constant.nativeAdView + "_" + id)

    init {
        methodChannel?.invokeMethod("initializing", null)
        val adId = creationParams!!["id"] as String?
        val config = TbFeedConfig.Builder()
            .codeId(adId) //平台申请的代码位id
            .build()
        TbManager.loadFeed(config, QBKJ.activity, object : TbManager.FeedLoadListener() {
            override fun onLoad(p0: FeedPosition?) {
                super.onLoad(p0)
                p0?.showFeed(QBKJ.activity, container)
            }
            override fun onFail(p0: String?) {
                TODO("Not yet implemented")
            }

            override fun onDismiss() {
                TODO("Not yet implemented")
            }

            override fun onVideoReady() {
                TODO("Not yet implemented")
            }

            override fun onVideoComplete() {
                TODO("Not yet implemented")
            }

        })

    }

    override fun getView(): View {
        return container
    }

    override fun dispose() {
        container.removeAllViews()
    }

}