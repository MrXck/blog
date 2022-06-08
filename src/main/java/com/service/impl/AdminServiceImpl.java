package com.service.impl;


import com.domain.Admin;
import com.mapper.AdminMapper;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    @Qualifier("adminMapper")
    private AdminMapper adminMapper;

    @Override
    public Admin findByUsernameAndPassword(Admin admin) {
        return adminMapper.findByUsernameAndPassword(admin);
    }

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin);
    }

    @Override
    public Admin findById(int id) {
        return adminMapper.findById(id);
    }
}
