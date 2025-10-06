package com.authorizationservice.authorization.dto;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.Id;


public class VaildatingDTO {
    @Id
    @JsonProperty
    private boolean validStatus;

	public VaildatingDTO(boolean validStatus) {
		super();
		this.validStatus = validStatus;
	}

	public VaildatingDTO() {
		super();
	}

	public boolean isValidStatus() {
		return validStatus;
	}

	public void setValidStatus(boolean validStatus) {
		this.validStatus = validStatus;
	}

	@Override
	public String toString() {
		return "VaildatingDTO [validStatus=" + validStatus + "]";
	}

	

    
}
