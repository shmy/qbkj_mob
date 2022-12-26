
#趣变科技

#tb混淆配置
-keep class com.android.tbnativec.** { *; }
-keep class com.tb.mob.** { *; }
-keep class com.tb.tb_lib.** { *; }
-keep class androidx.** { *; }
-keep public class com.netease.nis.sdkwrapper.Utils { public <methods>; }

# oaid_1.0.25 sdk
-keep class XI.CA.XI.**{*;}
-keep class XI.K0.XI.**{*;}
-keep class XI.XI.K0.**{*;}
-keep class XI.xo.XI.XI.**{*;}
-keep class com.asus.msa.SupplementaryDID.**{*;}
-keep class com.asus.msa.sdid.**{*;}
-keep class com.bun.lib.**{*;}
-keep class com.bun.miitmdid.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.opendeviceidlibrary.**{*;}
-keep class org.json.**{*;}
-keep public class com.netease.nis.sdkwrapper.Utils {public
<methods>;}
# oaid_2.0.0 sdk
-keep class com.bun.miitmdid.** { *; }
-keep interface com.bun.supplier.** { *; }
-keep class com.asus.msa.SupplementaryDID.** { *; }
-keep class com.asus.msa.sdid.** { *; }
-keep class com.android.creator.** { *; }
-keep class com.android.msasdk.** { *; }
-keep class com.huawei.hms.ads.** { *; }
-keep interface com.huawei.hms.ads.** {*; }
-keep class com.zui.deviceidservice.** { *; }
-keep class com.zui.opendeviceidlibrary.** { *; }
-keep class com.meizu.flyme.openidsdk.** { *; }
-keep class com.bun.miitmdid.provider.nubia.NubiaIdentityImpl { *; }
-keep class com.heytap.openid.** { *; }
-keep class com.samsung.android.deviceidservice.** { *; }
-keep class com.vivo.identifier.** { *; }
-keep class com.bun.miitmdid.provider.xiaomi.IdentifierManager { *; }
-keep class com.bun.lib.** { *; }
-keep class com.coolpad.deviceidsupport.** { *; }

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

#BeiZi混淆
-dontwarn com.beizi.fusion.**
-dontwarn com.beizi.ad.**
-keep class com.beizi.fusion.** {*; }
-keep class com.beizi.ad.** {*; }
-keep class com.qq.e.** {
    public protected *;
}
-keepattributes Exceptions,InnerClasses,Signature,Deprecated,SourceFile,LineNumberTable,*Annotation*,EnclosingMethod
-dontwarn  org.apache.**

#zk混淆配置
-keep class com.tb.zkmob.* { public *;}
-keep class com.tb.zkmob.bean.* { public *;}
-keep class com.tb.zkmob.config.* { public *;}
-keep class com.tb.zkmob.enums.* { public *;}



# 信天翁
#获取OAID的SDK
-keep classXI.CA.XI.**{*;}
-keep classXI.K0.XI.**{*;}
-keep classXI.XI.K0.**{*;}
-keep class XI.xo.XI.XI.**{*;}
-keep class com.asus.msa.SupplementaryDID.**{*;}
-keep class com.asus.msa.sdid.**{*;}
-keep class com.bun.lib.**{*;}
-keep class com.bun.miitmdid.**{*;}
-keep class com.huawei.hms.ads.identifier.**{*;}
-keep class com.samsung.android.deviceidservice.**{*;}
-keep class com.zui.opendeviceidlibrary.**{*;}
-keep class org.json.**{*;}
-keep public class com.netease.nis.sdkwrapper.Utils {public <methods>;}


#基础模块
-keep class com.youxiao.ssp.base.listener.* {
*; }
-keep class com.youxiao.ssp.base.bean.ShareData { public <methods>;
}
-keepclassmembers class * extends com.youxiao.ssp.base.core.JsBridge
{ public <methods>; }
-keep class com.youxiao.ssp.ad.core.AdClient { public <methods>;
}
-keep class com.youxiao.ssp.ad.listener.* {
*; }
-keep class com.youxiao.ssp.ad.bean.SSPAd { public <methods>;
}
-keep class com.youxiao.ssp.ad.bean.NextAdInfo { public *;
}
-keep class com.youxiao.ssp.ad.bean.SSPContentItem {
*** get*(); }
-keep class com.youxiao.ssp.coupon.listener.* { *;
}
-keep class com.youxiao.ssp.base.activity.SSPWebActivity
{ public <methods>; }
-keep class * extends com.youxiao.ssp.base.activity.SSPBaseActivity { public static <fields>;
public static <methods>;
}
-keep class * extends com.youxiao.ssp.base.activity.SSPBaseFragmentActivity
{ public static <fields>;
public static <methods>; }
-keep class * extends android.support.v4.app.Fragment { public static <fields>;
public static <methods>;
}
-keep class com.youxiao.ssp.core.SSPSdk
{ public <methods>; }


#广告模块（*** 纯电商优惠券SDK无需添加广告混淆配置 ***）
-keepclassmembers class * extends android.app.Activity
{ public void *(android.view.View);
}
-keepclassmembers enum *
{ public static **[]
values();
public static ** valueOf(java.lang.String);
}
-keep class com.baidu.mobads.** { *; }
-keep class com.baidu.mobad.** { *; }
-keep class com.qq.e.** {
*;
}
-keep class
android.support.v4.**{ public
*;
}
-keep class
android.support.v7.**{ public
*;
}

-keepclassmembers class * {
*** getContext(...);
*** getActivity(...);
*** getResources(...);
*** startActivity(...);
*** startActivityForResult(...);
*** registerReceiver(...);
*** unregisterReceiver(...);
*** query(...);
*** getType(...);
*** insert(...);
*** delete(...);
*** update(...);
*** call(...);
*** setResult(...);
*** startService(...);
*** stopService(...);
*** bindService(...);
*** unbindService(...);
*** requestPermissions(...);
*** getIdentifier(...);
}
-keep class com.bykv.vk.** { *; }
-keep class ms.bd.c.Pgl.**{*;}
-keep class com.bytedance.** { *; }
-keep class com.ss.android.** { *; }
-keep class com.lynx.** { *; }
-keep class android.support.v4.app.FragmentActivity{}
-keep class androidx.fragment.app.FragmentActivity{}
-keep class android.support.v4.app.FragmentActivity{}
-keep class androidx.fragment.app.FragmentActivity{}
-keep class org.chromium.** { *; }
-keep class aegon.chrome.** { *; }
-keep class com.kwai.**{ *; }
-keep class com.kwad.**{ *; }
-keep class com.ksad.**{ *; }
-keep class com.kuaishou.**{ *; }
-keep class com.yxcorp.**{ *; }
-keepclasseswithmembernames class *
{ native <methods>;
}
-dontwarn com.kwai.**
-dontwarn com.kwad.**
-dontwarn com.ksad.**
-dontwarn aegon.chrome.**
-keep class com.yilan.sdk.**{
*;
}
-dontwarn javax.annotation.**
-dontwarn sun.misc.Unsafe
-dontwarn org.conscrypt.*
-dontwarn okio.**
-keep class com.fun.** {*;}
-keep class com.funshion.** {*;}
-keep class android.support.annotation.Keep
-keep @android.support.annotation.Keep class *
{ @android.support.annotation.Keep <init>(...);
@android.support.annotation.Keep <methods>;
@android.support.annotation.Keep <fields>;
}
-keep class okhttp3.** {*;}
-keep class okio. {*;}
-keep class com.alibaba.fastjson.** {*;}
-keep class sun.misc.Unsafe { *; }
-dontwarn com.sigmob.**
-keep class com.sigmob.**.**{*;}
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.mbridge.** {*; }
-keep interface com.mbridge.** {*; }
-keep class android.support.v4.** { *; }
-dontwarn com.mbridge.**
-keep class **.R$* { public static final int mbridge*; }
#厂商广告平台（*** 未接入厂商广告平台或纯电商优惠券SDK无需添加广告混淆配置 ***）
-keep class com.miui.** { *;}
-keep class com.xiaomi.** { *; }
-keep class * extends android.os.IInterface{ *; }
-keep class com.huawei.openalliance.ad.** { *; }
-keep class com.huawei.hms.ads.** { *; }
-keepattributes SourceFile,LineNumberTable
-dontwarn com.squareup.okhttp.**
-dontwarn okhttp3.**
-keep class com.vivo.*.** { *; }
-dontwarn com.bytedance.article.common.nativecrash.NativeCrashInit
-keep class com.androidquery.callback.** {*;}
-keep class com.ss.sys.ces.* {*;}
-keep class com.opos.** { *;}
-keep class com.heytap.msp.mobad.api.** {*;}
-keep class com.heytap.openid.** {*;}
#电商模块（*** 纯广告SDK无需添加电商混淆配置 ***）
-keepattributes Signature
-ignorewarnings
-keep class javax.ws.rs.** { *; }
-keep class com.alibaba.fastjson.** { *; }
-dontwarn com.alibaba.fastjson.**
-keep class sun.misc.Unsafe { *; }
-dontwarn sun.misc.**
-keep class com.taobao.** {*;}
-keep class com.alibaba.** {*;}
-keep class com.alipay.** {*;}
-dontwarn com.taobao.**
-dontwarn com.alibaba.**
-dontwarn com.alipay.**
-keep class com.ut.** {*;}
-dontwarn com.ut.**
-keep class com.ta.** {*;}
-dontwarn com.ta.**
-keep class org.json.** {*;}
-keep class com.ali.auth.** {*;}
-dontwarn com.ali.auth.**
-keep class com.taobao.securityjni.** {*;}
-keep class com.taobao.wireless.security.** {*;}
-keep class com.taobao.dp.**{*;}
-keep class com.alibaba.wireless.security.**{*;}
-keep interface mtopsdk.mtop.global.init.IMtopInitTask {*;}
-keep class * implements mtopsdk.mtop.global.init.IMtopInitTask {*;}
-keep class com.kepler.jd.**{ public <fields>; public <methods>; public *; }
# gson（未使用该库可忽略）
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.examples.android.model.** { <fields>; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keepclassmembers,allowobfuscation class *
{ @com.google.gson.annotations.SerializedName <fields>;
}
# glide（未使用该库可忽略）
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule {
<init>(...);
}
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
**[] $VALUES;
public *;
}
-keep class
com.bumptech.glide.load.data.ParcelFileDescriptorRewinder$InternalRewinder {
*** rewind();
}
