package com.service.impl;

import com.domain.BlogTag;
import com.mapper.BlogTagMapper;
import com.service.BlogTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("blogTagService")
public class BlogTagServiceImpl implements BlogTagService {

    @Autowired
    @Qualifier("blogTagMapper")
    private BlogTagMapper blogTagMapper;

    @Override
    public List<BlogTag> findByBlogId(int id) {
        return blogTagMapper.findByBlogId(id);
    }

    @Override
    public List<BlogTag> findAll() {
        return blogTagMapper.findAll();
    }

    @Override
    public void deleteByBlogId(int id) {
        blogTagMapper.deleteByBlogId(id);
    }
}
