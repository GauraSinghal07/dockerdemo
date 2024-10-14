package com.nagarro.service;


import com.nagarro.model.Post;
import com.nagarro.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    @Cacheable("posts")
    public List<Post> findAll() {
        // Simulate a slow response by adding a delay
        List<Post> post = new ArrayList<>();

        try {
            post = postRepository.findAll();
            Thread.sleep(3000); // 3-second delay to simulate a slow query
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return post;
    }

    public Post save(Post post) {
        return postRepository.save(post);
    }
}
