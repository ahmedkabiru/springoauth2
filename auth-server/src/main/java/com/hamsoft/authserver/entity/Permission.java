package com.hamsoft.authserver.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;

/**
 * Created By kabiruahmed on Jan 2019
 */

@Getter
@Setter
@Entity
public class Permission extends BaseIdEntity {

    private String name;

}
