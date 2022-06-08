package com.mapper;

import com.domain.BlogType;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BlogTypeMapper {

    @Select("select * from blog_type where id=#{id}")
    BlogType findById(int id);

    @Select("select * from blog_type")
    List<BlogType> findAll();

    @Insert("insert into blog_type values(#{id}, #{name}, 0)")
    void save(BlogType blogType);

    @Update("update blog_type set name=#{name} where id=#{id}")
    void update(BlogType blogType);

    @Delete("delete from blog_type where id=#{id}")
    void deleteById(int id);


}
