#tb混淆配置
-keep class com.tb.mob.* { public *;}
-keep class com.tb.mob.bean.* { public *;}
-keep class com.tb.mob.config.* { public *;}
-keep class com.tb.mob.enums.* { public *;}
-keep class com.tb.mob.h5.* { public *;}
-keep class com.tb.mob.utils.* { public *;}
-keep class com.tb.mob.more.* { public *;}
-keep class com.tb.mob.saas.* { public *;}

#CSJ混淆配置
-keep class com.bytedance.sdk.openadsdk.** { *; }
-keep class com.bytedance.frameworks.** { *; }
-keep class ms.bd.c.Pgl.**{*;}
-keep class com.bytedance.mobsec.metasec.ml.**{*;}
-keep class com.ss.android.**{*;}
-keep class com.bytedance.embedapplog.** {*;}
-keep class com.bytedance.embed_dr.** {*;}
-keep class com.bykv.vk.** {*;}

#GDT混淆配置
-keep class com.tencent.smtt.** { *; }
-dontwarn dalvik.**
-dontwarn com.tencent.smtt.**
-keep class com.qq.e.** {
    public protected *;
}

#KS混淆配置
-keep class org.chromium.** {*;}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }
-keep class com.kwad.**{ *; }
-keepclasseswithmembernames class * {
 native <methods>;
}
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**

#BD混淆配置
-ignorewarnings
-dontwarn com.baidu.mobads.sdk.api.**
-keepclassmembers class * extends android.app.Activity {
   public void *(android.view.View);
}
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep class com.baidu.mobads.** { *; }
-keep class com.style.widget.** {*;}
-keep class com.component.** {*;}
-keep class com.baidu.ad.magic.flute.** {*;}
-keep class com.baidu.mobstat.forbes.** {*;}

#SigMob混淆配置
-keep class sun.misc.Unsafe { *; }
-dontwarn com.sigmob.**
-keep class com.sigmob.**.**{*;}
-keep interface com.sigmob.**.**{*;}
-keep class com.czhj.**{*;}
-keep interface com.czhj.**{*;}

#语音红包混淆配置
-keep class com.xlx.speech.voicereadsdk.** { *; }

#Mintegral混淆配置
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.mbridge.** {*; }
-keep interface com.mbridge.** {*; }
-keep interface androidx.** { *; }
-keep class androidx.** { *; }
-keep public class * extends androidx.** { *; }
-keep class android.support.v4.** { *; }
-dontwarn com.mbridge.**
-keep class **.R$* { public static final int mbridge*; }

#YmNovel混淆配置
-dontwarn com.iBookStar.**
-keep class com.iBookStar.**{*;}
-dontwarn dalvik.**
-dontwarn com.tencent.smtt.**
-keep class com.tencent.smtt.** {*;}
-keep class com.tencent.tbs.** {*;}

#多量相关的混淆配置
-dontoptimize
-dontpreverify
-dontwarn com.duoyou.**
-keep class com.duoyou.**{*;}
-keep class **.R$* {
 *;
}
-keepclassmembers class **.R$* {
public static <fields>;
}

#zk混淆配置
-keep class com.tb.zkmob.* { public *;}
-keep class com.tb.zkmob.bean.* { public *;}
-keep class com.tb.zkmob.config.* { public *;}
-keep class com.tb.zkmob.enums.* { public *;}

