package com.domain;

import java.io.File;

public class Picture {
    private String picture_name;
    private byte[] content;
    private File image;

    public byte[] getContent() {
        return content;
    }

    public String getPicture_name() {
        return picture_name;
    }

    public void setPicture_name(String picture_name) {
        this.picture_name = picture_name;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }

    public File getImage() {
        return image;
    }

    public void setImage(File image) {
        this.image = image;
    }
}
