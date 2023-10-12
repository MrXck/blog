package com.service;

import com.domain.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> findByBlogId(int id);

    void save(Comment comment);

    void deleteById(int id);
}
