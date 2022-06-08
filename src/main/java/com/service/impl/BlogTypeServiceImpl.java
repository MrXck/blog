package com.service.impl;

import com.domain.BlogType;
import com.mapper.BlogTypeMapper;
import com.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {

    @Autowired
    @Qualifier("blogTypeMapper")
    private BlogTypeMapper blogTypeMapper;

    @Override
    public BlogType findById(int id) {
        return blogTypeMapper.findById(id);
    }

    @Override
    public List<BlogType> findAll() {
        return blogTypeMapper.findAll();
    }

    @Override
    public void save(BlogType blogType) {
        blogTypeMapper.save(blogType);
    }

    @Override
    public void update(BlogType blogType) {
        blogTypeMapper.update(blogType);
    }

    @Override
    public void deleteById(int id) {
        blogTypeMapper.deleteById(id);
    }
}
