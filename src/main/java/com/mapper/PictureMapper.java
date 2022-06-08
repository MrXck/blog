package com.mapper;

import com.domain.Picture;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;

public interface PictureMapper {

    @Select("select * from picture where picture_name=#{filename}")
    Picture findByFilename(String filename);

//    @Insert("insert into picture values(1, #{name}, #{content, typeHandler=org.apache.ibatis.type.BlobTypeHandler})")
    void save(Picture picture);

}
