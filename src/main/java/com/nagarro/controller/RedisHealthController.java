package com.nagarro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RedisHealthController {

    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    @GetMapping("/api/redis-health")
    public String checkRedisConnection() {
        try {
            // Ping Redis to check connectivity
            return redisConnectionFactory.getConnection().ping();
        } catch (Exception e) {
            return "Redis connection failed: " + e.getMessage();
        }
    }
}


