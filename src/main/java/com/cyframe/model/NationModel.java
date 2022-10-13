package com.cyframe.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class NationModel implements Serializable {

	private static final long serialVersionUID = 1L;

	private String NATION_CODE;
	private String NATION_NAME_KR;
	private String NATION_NAME_EN;
}
