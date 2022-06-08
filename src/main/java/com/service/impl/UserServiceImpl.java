package com.service.impl;

import com.domain.User;
import com.mapper.UserMapper;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    @Qualifier("userMapper")
    private UserMapper userMapper;

    @Override
    public User findByUsernameAndPassword(User user) {
        return userMapper.findByUsernameAndPassword(user);
    }

    @Override
    public Boolean save(User user) {
        User user1 = userMapper.findByUsername(user);
        if(user1 == null){
            userMapper.save(user);
            return true;
        }
        return false;
    }

    @Override
    public User findById(User user) {
        return userMapper.findById(user.getId());
    }
}
