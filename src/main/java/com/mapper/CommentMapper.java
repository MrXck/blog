package com.mapper;

import com.domain.Comment;
import com.domain.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CommentMapper {

    @Select("select * from comment where blog_id=#{id} order by create_time desc")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "content", property = "content"),
            @Result(column = "comment_id", property = "comment_id"),
            @Result(column = "create_time", property = "create_time"),
            @Result(
                    column = "user_id",
                    property = "user",
                    javaType = User.class,
                    one = @One(select = "com.mapper.UserMapper.findById")
            ),
            @Result(column = "comment_id", property = "comment_id"),
    })
    List<Comment> findByBlogId(int id);

    @Insert("insert into comment values(#{id}, #{content}, #{create_time}, #{user_id}, #{comment_id}, #{blog_id})")
    void save(Comment comment);

    @Delete("delete from comment where id=#{id}")
    void deleteById(int id);
}
