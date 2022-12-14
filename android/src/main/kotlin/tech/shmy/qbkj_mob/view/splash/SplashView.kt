package tech.shmy.qbkj_mob.view.splash

import tech.shmy.qbkj_mob.Constant
import android.view.View
import android.widget.FrameLayout
import com.tb.mob.TbManager
import com.tb.mob.TbManager.SplashLoadListener
import com.tb.mob.config.TbSplashConfig
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import tech.shmy.qbkj_mob.QBKJ


class SplashView(
    messenger: BinaryMessenger,
    id: Int,
    creationParams: Map<String?, Any?>?
) : PlatformView {
    private val container: FrameLayout = QBKJ.getEmptyContainer()
    private var methodChannel: MethodChannel? =
        MethodChannel(messenger, Constant.splashAdView + "_" + id)

    init {
        methodChannel?.invokeMethod("initializing", null)
        val adId = creationParams!!["id"] as String?
        val width = creationParams["width"] as Double
        val height = creationParams["height"] as Double
        val config = TbSplashConfig.Builder()
            .codeId(adId) //平台申请的代码位id
            .container(container) //承载视图的容器。可⾃定义⾼度⽐例,但不能低于0.75
            .viewWidth(width.toInt())
            .viewHigh(height.toInt())
            .build()
        TbManager.loadSplash(config, QBKJ.activity, object : SplashLoadListener {

            override fun onClicked() {
                methodChannel?.invokeMethod("onClick", null)
            }

            override fun onExposure() {
                methodChannel?.invokeMethod("onShow", null)
            }

            override fun onFail(s: String) {
                methodChannel?.invokeMethod("onError", s)
                container.removeAllViews()
            }

            override fun onSkip() {
                methodChannel?.invokeMethod("onSkip", null)
            }

            override fun onTick(p0: Long) {

            }

            override fun onTimeOver() {
                methodChannel?.invokeMethod("onTimeOver", null)
            }

            override fun onDismiss() {
                methodChannel?.invokeMethod("onDismiss", null)
                container.removeAllViews()
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