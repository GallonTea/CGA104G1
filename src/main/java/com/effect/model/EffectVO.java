package com.effect.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Setter
@Getter

public class EffectVO implements Serializable {


	private Integer effect_id;
	private String effect_name;
	private String effect_info;

	
}
