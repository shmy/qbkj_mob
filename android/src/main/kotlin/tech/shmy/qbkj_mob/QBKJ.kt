package tech.shmy.qbkj_mob

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.widget.LinearLayout
import com.tb.mob.TbManager
import com.tb.mob.config.TbInitConfig
import com.tb.mob.utils.RequestPermission
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
        RequestPermission.RequestPermissionIfNecessary(activity);
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
    }
}