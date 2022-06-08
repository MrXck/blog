package com.service;

import com.domain.Blog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BlogService {
    List<Blog> findAll();

    int findAllNum();

    List<Blog> findByTitle(String title);

    List<Blog> findByTypeId(int type_id);

    Blog findById(int id);

    List<Blog> findByTitleAndTypeId(String title, int type_id);

    List<Blog> findByDate(String date);

    List<String> findArchives();

    void save(Blog blog);

    void update(Blog blog);

    void deleteById(int id);

}
