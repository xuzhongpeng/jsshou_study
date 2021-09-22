package com.example.ui_project.opengl;

import android.app.Activity;
import android.opengl.GLSurfaceView;
import android.os.Bundle;

import androidx.annotation.Nullable;

import com.example.ui_project.opengl.MyGLSurfaceView;

public class OpenGLActivity  extends Activity {
    private GLSurfaceView mGLView;
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mGLView = new MyGLSurfaceView(this);
        setContentView(mGLView);
    }
}
