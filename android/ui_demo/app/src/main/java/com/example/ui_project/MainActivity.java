package com.example.ui_project;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.nfc.Tag;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;

import androidx.annotation.RequiresApi;

import com.example.ui_project.opengl.OpenGLActivity;
import com.example.ui_project.thread.MyRunnable;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


public class MainActivity extends Activity {
    private LinearLayout mainLayout;
    @RequiresApi(api = Build.VERSION_CODES.O)
    final static String Tag = "mainActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mainLayout = (LinearLayout) findViewById(R.id.main_layout);
        LayoutInflater layoutInflater = LayoutInflater.from(this);
        View buttonLayout = layoutInflater.inflate(R.layout.button_layout, null);
        View buttonLayout2 = layoutInflater.inflate(R.layout.button_layout2, null);
        View buttonLayout3 = layoutInflater.inflate(R.layout.button_layout3, null);
        mainLayout.addView(buttonLayout);
        mainLayout.addView(buttonLayout2);
        mainLayout.addView(buttonLayout3);
        final Context context = this;
        Intent intent = new Intent();
        String packageName = context.getPackageName();
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        if (!pm.isIgnoringBatteryOptimizations(packageName)) {
            intent.setAction(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
            intent.setData(Uri.parse("package:" + packageName));
        }
        final Intent intentOne = new Intent(context, TimerService.class);
        buttonLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //连续启动Service
                startService(intentOne);
            }
        });
        buttonLayout2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                stopService(intentOne);
                Intent intent = new Intent(context, OpenGLActivity.class);
                startActivity(intent);
            }
        });
        // 开启线程
        buttonLayout3.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.O)
            @Override
            public void onClick(View v) {
                Log.i(Tag, "UI线程id是" + Thread.currentThread().getId());
                MyRunnable runnable = new MyRunnable();
                new Thread(runnable).start();

                new Thread(new Runnable() {
                    @RequiresApi(api = Build.VERSION_CODES.O)
                    @Override
                    public void run() {
                        Log.i(Tag, "线程ID是" + Thread.currentThread().getId());
                    }
                }).start();
            }
        });
    }

    public final static String EXTRA_MESSAGE = "com.example.ui_project.MESSAGE";

    public void sendMessage(View view) {
        // Do something in response to button
        Log.i("xzp", "按钮");
        Intent intent = new Intent(this, MainActivity2.class);
        EditText editText = (EditText) findViewById(R.id.edit_message);
        String message = editText.getText().toString();
        intent.putExtra(EXTRA_MESSAGE, message);
        startActivity(intent);
    }

    // 步骤1:加载生成的so库文件
    // 注意要跟.so库文件名相同
    static {
        System.loadLibrary("hello_jni");
    }

    // 步骤2:定义在JNI中实现的方法
    public native String getFromJNI();
    @RequiresApi(api = Build.VERSION_CODES.O)
    public void  helloJni(View view){
            Log.i(Tag,getFromJNI());
    }
    /// 开启线程池
    public void openThreadPool(View view) {
        ExecutorService a = Executors.newFixedThreadPool(5);
        ThreadPoolExecutor fixedThreadPool = new ThreadPoolExecutor(5,
                10,
                1,
                TimeUnit.SECONDS,
                new LinkedBlockingDeque<Runnable>(100)
        );
        for (int i = 0; i < 30; i++) {
            final int finalI = i;
            Runnable runnable = new Runnable() {
                @Override
                public void run() {
//                    SystemClock.sleep(2000);
                    Log.d("google_lenve_fb", "run: " + finalI + "   "+ Thread.currentThread().getId());
                }
            };
            fixedThreadPool.execute(runnable);
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    public boolean isIgnoringBatteryOptimizations(Context context) {
        boolean isIgnoring = false;
        PowerManager powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);

        if (powerManager != null)
            isIgnoring = powerManager.isIgnoringBatteryOptimizations("com.example.ui_project");

        return isIgnoring;
    }

    /**
     * 跳转到指定应用的首页
     */
    public void showActivity(String packageName, Context context) {
        Intent intent = context.getPackageManager().getLaunchIntentForPackage(packageName);
        context.startActivity(intent);
    }

    /**
     * 跳转到指定应用的指定页面
     */
    public void showActivity(String packageName, String activityDir, Context context) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName(packageName, activityDir));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
}
