package com.service.impl;

import com.domain.Picture;
import com.mapper.PictureMapper;
import com.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("pictureService")
public class PictureServiceImpl implements PictureService {

    @Autowired
    @Qualifier("pictureMapper")
    private PictureMapper pictureMapper;

    @Override
    public Picture findByFilename(String filename) {
        return pictureMapper.findByFilename(filename);
    }

    @Override
    public void save(Picture picture) {
        pictureMapper.save(picture);
    }
}
