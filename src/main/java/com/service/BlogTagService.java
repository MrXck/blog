package com.service;

import com.domain.BlogTag;

import java.util.List;

public interface BlogTagService {
    List<BlogTag> findByBlogId(int id);

    List<BlogTag> findAll();

    void deleteByBlogId(int id);
}
