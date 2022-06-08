package com.mapper;

import com.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;


public interface UserMapper {
    @Select("select * from account where username=#{username}")
    User findByUsername(User user);

    @Select("select * from account where username=#{username} and password=#{password}")
    User findByUsernameAndPassword(User user);

    @Insert("insert into account values(#{id}, #{username}, #{password})")
    Boolean save(User user);

    @Select("select * from account where id=#{id}")
    User findById(int id);


}
