package com.service.impl;

import com.domain.Blog;
import com.mapper.BlogMapper;
import com.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Autowired
    @Qualifier("blogMapper")
    private BlogMapper blogMapper;

    @Override
    public List<Blog> findAll() {
        return blogMapper.findAll();
    }

    @Override
    public int findAllNum() {
        return blogMapper.findAllNum();
    }

    @Override
    public List<Blog> findByTitle(String title) {
        return blogMapper.findByTitle(title);
    }

    @Override
    public List<Blog> findByTypeId(int type_id) {
        return blogMapper.findByTypeId(type_id);
    }

    @Override
    public Blog findById(int id) {
        return blogMapper.findById(id);
    }

    @Override
    public List<Blog> findByTitleAndTypeId(String title, int type_id) {
        return blogMapper.findByTitleAndTypeId(title, type_id);
    }

    @Override
    public List<Blog> findByDate(String date) {
        String start = date + "-01";
        String end = date + "-31";
        return blogMapper.findByDate(start, end);
    }

    @Override
    public List<String> findArchives() {
        return blogMapper.findArchives();
    }


    @Override
    public void save(Blog blog) {
        blogMapper.save(blog);
    }

    @Override
    public void update(Blog blog) {
        blogMapper.update(blog);
    }

    @Override
    public void deleteById(int id) {
        blogMapper.deleteById(id);
    }
}
