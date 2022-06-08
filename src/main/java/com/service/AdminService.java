package com.service;

import com.domain.Admin;

public interface AdminService {

    Admin findByUsernameAndPassword(Admin admin);

    void update(Admin admin);

    Admin findById(int id);
}
