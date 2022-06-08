package com.mapper;

import com.domain.BlogTag;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BlogTagMapper {

    @Select("select * from blog_tag")
    List<BlogTag> findAll();

    @Select("select * from blog_tag bt,blog_tag_relation btr where bt.id=btr.tag_id and btr.blog_id=#{id}")
    List<BlogTag> findByBlogId(int id);

    @Delete("delete from blog_tag_relation where blog_id=#{id}")
    void deleteByBlogId(int id);
}
