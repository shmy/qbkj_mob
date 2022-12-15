package tech.shmy.qbkj_mob.view.feed

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


class FeedView(
    messenger: BinaryMessenger,
    id: Int,
    creationParams: Map<String?, Any?>?
) : PlatformView {
    private val container: LinearLayout = QBKJ.getEmptyContainer()
    private var methodChannel: MethodChannel? =
        MethodChannel(messenger, Constant.feedAdView + "_" + id)

    init {
        methodChannel?.invokeMethod("initializing", null)
        val adId = creationParams!!["id"] as String?
        val width = creationParams["width"] as Double
        val height = creationParams["height"] as Double
        val config = TbFeedConfig.Builder()
            .codeId(adId) //平台申请的代码位id
            .viewWidth(width.toInt())
            .viewHigh(height.toInt())
            .build()
        TbManager.loadFeed(config, QBKJ.activity, object : TbManager.FeedLoadListener {
            override fun onLoad(p0: FeedPosition?) {
                p0?.showFeed(QBKJ.activity, container)
            }
            override fun onExposure() {
                methodChannel?.invokeMethod("onShow", null)
            }

            override fun onFail(s: String) {
                methodChannel?.invokeMethod("onError", s)
                container.removeAllViews()
            }

            override fun onClicked() {
                methodChannel?.invokeMethod("onClick", null)
            }

            override fun onDismiss() {
                methodChannel?.invokeMethod("onDismiss", null)
                container.removeAllViews()
            }
            override fun onVideoReady() {
            }

            override fun onVideoComplete() {
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