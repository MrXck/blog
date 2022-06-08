package com.service;

import com.domain.Picture;

import java.util.Map;

public interface PictureService {

    Picture findByFilename(String filename);

    void save(Picture picture);
}
