package aspects;

import healthwatcher.model.address.*;

public aspect AttributesMethodsInjection {
	
	private int Address.code;

	private String Address.street;

	private String Address.complement;

	private String Address.zip;

	private String Address.state;

	private String Address.phone;

	private String Address.city;

	private String Address.neighbourhood;
	
	public Address.new(String street, String complement, String zip, String state, String phone,
			String city, String neighbourhood) {

		this.street = street;
		this.complement = complement;
		this.zip = zip;
		this.state = state;
		this.phone = phone;
		this.city = city;
		this.neighbourhood = neighbourhood;
	}
	
	
	public String Address.getCity() {
		return city;
	}

	public void Address.setCity(String city) {
		this.city = city;
	}

	public int Address.getCode() {
		return code;
	}

	public void Address.setCode(int code) {
		this.code = code;
	}

	public String Address.getComplement() {
		return complement;
	}

	public void Address.setComplement(String complement) {
		this.complement = complement;
	}

	public String Address.getNeighbourhood() {
		return neighbourhood;
	}

	public void Address.setNeighbourhood(String neighbourhood) {
		this.neighbourhood = neighbourhood;
	}

	public String Address.getPhone() {
		return phone;
	}

	public void Address.setPhone(String phone) {
		this.phone = phone;
	}

	public String Address.getState() {
		return state;
	}

	public void Address.setState(String state) {
		this.state = state;
	}

	public String Address.getStreet() {
		return street;
	}

	public void Address.setStreet(String street) {
		this.street = street;
	}

	public String Address.getZip() {
		return zip;
	}

	public void Address.setZip(String zip) {
		this.zip = zip;
	}


}
