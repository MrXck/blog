package com.mapper;

import com.domain.Blog;
import com.domain.BlogType;
import com.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface BlogMapper {

    @Select("select * from blog order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    List<Blog> findAll();

    @Select("select count(*) from blog")
    int findAllNum();

    @Select("select * from blog where title LIKE concat('%', #{title}, '%') order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    List<Blog> findByTitle(@Param("title") String title);

    @Select("select * from blog where create_time > #{start} and create_time < #{end} order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    List<Blog> findByDate(@Param("start") String start, @Param("end") String end);

    @Select("select * from blog where type_id=#{type_id} order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    List<Blog> findByTypeId(int type_id);

    @Select("select * from blog where type_id=#{type_id} and title LIKE concat('%', #{title}, '%') order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    List<Blog> findByTitleAndTypeId(@Param("title") String title, @Param("type_id") int type_id);

    @Select("select * from blog where id=#{id} order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    property = "admin",
                    column = "admin_id",
                    javaType = User.class,
                    one = @One(select = "com.mapper.AdminMapper.findById")
            ),
            @Result(
                    property = "blogTagList",
                    column = "id",
                    javaType = List.class,
                    many = @Many(select = "com.mapper.BlogTagMapper.findByBlogId")
            ),
            @Result(
                    property = "blogType",
                    column = "type_id",
                    javaType = BlogType.class,
                    one = @One(select = "com.mapper.BlogTypeMapper.findById")
            )
    })
    Blog findById(int id);

    @Select("SELECT DISTINCT concat(YEAR(post.create_time), '-' ,MONTH(post.create_time)) as date FROM blog AS post limit 0,12")
    List<String> findArchives();

    @Insert("insert into blog values(#{id}, #{title}, #{content}, #{admin_id}, #{date}, #{type_id})")
    void save(Blog blog);

    @Update("update blog set title=#{title}, content=#{content}, type_id=#{type_id} where id=#{id}")
    void update(Blog blog);

    @Delete("delete from blog where id=#{id}")
    void deleteById(int id);


//    通过tag_id查找博客暂时不实现
//    @Select("")
//    List<Blog> findByTagId(int tag_id);


}
