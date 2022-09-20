package tech.shmy.qbkj_mob.activity

import android.graphics.Color
import android.os.Bundle
import android.widget.TextView
import androidx.fragment.app.FragmentActivity
import com.tb.mob.bean.VideoTypeEnum
import tech.shmy.qbkj_mob.R


class QBKJShortVideoActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val extras = intent.extras!!
        setContentView(R.layout.qbkj_short_video_activity)
        findViewById<TextView>(R.id.back_button).apply {
            textSize = 18f
            text = extras.getString("backText")
            setTextColor(Color.WHITE)
            setShadowLayer(1F, 0F, 0F, Color.BLACK);
            setOnClickListener {
                finish()
            }
        }

//        TbVideoManager.replaceFrameLayout4Video(
//            this,
//            extras.getString("adCode"),
//            "",
//            "",
//            object : TbVideoManager.IReplaceListener {
//                override fun onFail(s: String) {}
//                override fun getContentPage(contentPage: KsContentPage) {
//                    supportFragmentManager.beginTransaction()
//                        .replace(R.id.fragment_container, contentPage.fragment)
//                        .commitAllowingStateLoss()
//                }
//
//                override fun onVideoPlayStart(videoTypeEnum: VideoTypeEnum) {}
//                override fun onVideoPlayPaused(videoTypeEnum: VideoTypeEnum) {}
//                override fun onVideoPlayResume(videoTypeEnum: VideoTypeEnum) {}
//                override fun onVideoPlayCompleted(videoTypeEnum: VideoTypeEnum) {}
//                override fun onPageLeave(videoTypeEnum: VideoTypeEnum) {}
//            })
    }
}