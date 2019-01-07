package com.hamsoft.authserver.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Created By kabiruahmed on Jan 2019
 */
@NoRepositoryBean
public interface BaseRepository<T> extends JpaRepository<T,Long> {
}
