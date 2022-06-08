package com.service;

import com.domain.User;

public interface UserService {

    User findByUsernameAndPassword(User user);

    Boolean save(User user);

    User findById(User user);

}
