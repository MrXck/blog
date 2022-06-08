package com.service;

import com.domain.BlogType;

import java.util.List;

public interface BlogTypeService {

    BlogType findById(int id);

    List<BlogType> findAll();

    void save(BlogType blogType);

    void update(BlogType blogType);

    void deleteById(int id);
}
