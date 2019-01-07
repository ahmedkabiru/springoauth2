package com.hamsoft.authserver.repository;


import com.hamsoft.authserver.entity.User;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created By kabiruahmed on Jan 2019
 */

@Transactional
public interface UserRepository extends BaseRepository<User>{
    User findByUsername(String username);
}
