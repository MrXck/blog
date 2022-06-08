package com.mapper;

import com.domain.Admin;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface AdminMapper {

    @Select("select id,username from admin where username=#{username} and password=#{password}")
    Admin findByUsernameAndPassword(Admin admin);

    @Select("select id,username from admin where id=#{id}")
    Admin findById(int id);

    @Update("update admin set username=#{username}, password=#{password} where id=#{id}")
    void update(Admin admin);

}
