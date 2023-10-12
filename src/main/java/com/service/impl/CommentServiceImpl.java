package com.service.impl;

import com.domain.Comment;
import com.mapper.CommentMapper;
import com.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    @Qualifier("commentMapper")
    private CommentMapper commentMapper;

    @Override
    public List<Comment> findByBlogId(int id) {
        return commentMapper.findByBlogId(id);
    }

    @Override
    public void save(Comment comment) {
        commentMapper.save(comment);
    }

    @Override
    public void deleteById(int id) {
        commentMapper.deleteById(id);
    }
}
