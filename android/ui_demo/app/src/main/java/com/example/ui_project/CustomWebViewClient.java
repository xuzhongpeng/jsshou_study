package com.example.ui_project;

import android.annotation.TargetApi;
import android.os.Build;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.RequiresApi;

class CustomWebViewClient extends WebViewClient {
    final String TAG = "webview";

    @SuppressWarnings("deprecation")
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        return urlLoading(view, url);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        String url = request.getUrl().toString();
        return urlLoading(view, url);
    }

    private boolean urlLoading(WebView view, String uri) {
        Log.i(TAG, "Uri =" + uri);
        return false;
    }
}